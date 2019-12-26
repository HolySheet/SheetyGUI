import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/gestures/drag_details.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sheety_gui/scoped_model/base_model.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/utility.dart';

class ListModel extends BaseModel {
  static const LogicalKeyboardKey keyControl = LogicalKeyboardKey(0x10200000011, keyLabel: r'ctrl', debugName: 'Key Control');

  final _conn = locator<JavaConnectorService>();

  List<ListItem> listItems = [];
  List<ListItem> selected = [];
  ListItem showingSelected; // Filled with dummy values when multiple selected
  bool multiSelect = false;

  // ANIMATION

  AnimationController animationController;
  Animation<double> widthAnimation;
  bool showSidebar = false;
//  bool isCollapsed = true;

  double startX = 0;
  double lastX = 0;

  void click() {
    print('Click!');

    _conn.connect();
  }

  void refreshFiles() {
    print('Refreshing files!');

    _conn
        .send()
        .then((response) => listItems = response.items)
        .whenComplete(notifyListeners);
  }

  void onKey(RawKeyEvent event) {
    multiSelect = event.data.logicalKey == keyControl;
  }

  void tapFile(ListItem item) {
    if (selected.contains(item)) {
      selected.remove(item);
      notifyListeners();

      if (multiSelect) {
        if (selected.isEmpty) {
          animationController.forward().whenComplete(() {
            showSidebar = false;
            showingSelected = null;
            notifyListeners();
          });
        } else {
          updateSelected();
          notifyListeners();
        }
      } else {
        selected = [];
        animationController.forward().whenComplete(() {
          showSidebar = false;
          showingSelected = null;
          notifyListeners();
        });
      }
    } else {
      showSidebar = true;

      if (!multiSelect) {
        selected.clear();
      }

      selected.add(item);

      updateSelected();
      notifyListeners();
      resetCollapse();
    }
  }

  void updateSelected() {
    if (selected.length > 1) {
      showingSelected = getCombined();
    } else {
      showingSelected = selected[0];
    }
  }

  ListItem getCombined() =>
    ListItem('${selected.length} Selected', selected.sumMap((item) => item.size), selected.sumMap((item) => item.sheets), selected[0].date, selected.map((item) => item.id).join(', '));

  String formatDate(int date) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(date);
    var format = DateFormat.yMd().add_jm();
    return format.format(dateTime);
  }

  // ANIMATION

  void init(SingleTickerProviderStateMixin tickProvider) {
    animationController = AnimationController(
        lowerBound: 0,
        upperBound: 250,
        vsync: tickProvider,
        duration: Duration(milliseconds: 500));

    widthAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);

    notifyListeners();

    animationController.value = 250;
  }

  void sideDragStart(DragStartDetails start) {
    lastX = startX = start.globalPosition.dx;
  }

  void sideDragUpdate(DragUpdateDetails update) {
    lastX = update.globalPosition.dx;
    var moved = lastX - startX;
    if (moved < 0) return;
    animationController.value = moved;
  }

  void sideDragEnd(DragEndDetails end) {
    var percentage = (lastX - startX) / 250;
    var velocity = end.primaryVelocity; // Pixels per second
    if (percentage >= 0.1 || velocity >= 200) {
        animationController.forward(from: lastX - startX).whenComplete(() {
          showSidebar = false;
          notifyListeners();
        });
    }
  }

  TickerFuture resetCollapse() => animationController.reverse();
}
