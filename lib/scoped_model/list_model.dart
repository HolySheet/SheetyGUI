import 'package:flutter/animation.dart';
import 'package:flutter/src/gestures/drag_details.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sheety_gui/scoped_model/base_model.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/payload/list_response.dart';

class ListModel extends BaseModel {
  final _conn = locator<JavaConnectorService>();

  List<ListItem> listItems = [];
  ListItem selected;

  // ANIMATION

  AnimationController animationController;
  Animation<double> widthAnimation;
  bool isCollapsed = true;

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

  void tapFile(ListItem item) {
    if (selected == item) {
      selected = null;
      animationController.forward().whenComplete(() {
        isCollapsed = true;
        notifyListeners();
      });
    } else {
      selected = item;
      resetCollapse();
    }
  }

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
    if (moved / 250 == 1) {
      isCollapsed = true;
    }
  }

  void sideDragEnd(DragEndDetails end) {
    var percentage = (lastX - startX) / 250;
    var velocity = end.primaryVelocity; // Pixels per second
    if (percentage >= 0.1 || velocity >= 200) {
      if (!isCollapsed) {
        animationController.forward(from: lastX - startX).whenComplete(() {
          isCollapsed = true;
          notifyListeners();
        });
      }
    }
  }

  void resetCollapse() {
    if (isCollapsed) {
      isCollapsed = false;
      notifyListeners();
      animationController.reverse();
    } else {
      notifyListeners();
    }
  }
}
