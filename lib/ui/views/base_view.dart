import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sheety_gui/enums/view_states.dart';
import 'package:sheety_gui/scoped_model/base_model.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/ui/widgets/busy_overlay.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final ScopedModelDescendantBuilder<T> _builder;
  final Function(T) onModelReady;
  final Function(T) onModelEnd;
  final Function(T) fabAdd;
  final bool showFab;

  BaseView(
      {GlobalKey<ScaffoldState> scaffoldKey,
      ScopedModelDescendantBuilder<T> builder,
      this.onModelReady,
      this.onModelEnd,
      this.fabAdd,
      this.showFab = true})
      : _scaffoldKey = scaffoldKey,
        _builder = builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T _model = locator<T>();
  ScopedModelDescendantBuilder<T> otherBuilder;

  @override
  void initState() {
    otherBuilder = (context, child, BaseModel model) => BusyOverlay(
          show: model.state == ViewState.Busy,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            key: widget._scaffoldKey,
            floatingActionButton: (!widget.showFab
                ? null
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      if (widget.fabAdd != null) {
                        widget.fabAdd(_model);
                      }
                    },
                  )),
            body: Row(
              children: [
                Container(
//                  margin: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.all(0),
                    child: Column(
                      children: [
                        getLeftButton(
                            icon: Icons.view_module,
                            label: 'File list',
                            onPressed: () {
                              print('Pressed list');
                            }),
                        getLeftButton(
                            icon: Icons.developer_board,
                            label: 'Console',
                            onPressed: () {
                              print('Pressed console');
                            }),
                        getLeftButton(
                            icon: Icons.schedule,
                            label: 'Schedule',
                            onPressed: () {
                              print('Pressed schedule');
                            }),
                        getLeftButton(
                            icon: Icons.insert_drive_file,
                            label: 'Logs',
                            onPressed: () {
                              print('Pressed logs');
                            }),
                        Spacer(),
                        getLeftButton(
                            icon: Icons.settings,
                            label: 'Settings',
                            onPressed: () {
                              print('Pressed settings');
                            }),
                      ],
                    ),
                  ),
                ),

//            Card(
//              elevation: 5,
//              decoration: BoxDecoration(
//                color: Theme.of(context).cardColor,
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.red,
//                    blurRadius: 15,
//                    spreadRadius: 3,
//                    offset: Offset(10, 0),
//                  )
//                ],
//              ),

//              child: Column(
//                children: [
//                  getLeftButton(icon: Icons.view_module, label: 'File list', onPressed: () {
//                    print('Pressed list');
//                  }),
//                  getLeftButton(icon: Icons.developer_board, label: 'Console', onPressed: () {
//                    print('Pressed console');
//                  }),
//                  getLeftButton(icon: Icons.schedule, label: 'Schedule', onPressed: () {
//                    print('Pressed schedule');
//                  }),
//                  getLeftButton(icon: Icons.insert_drive_file, label: 'Logs', onPressed: () {
//                    print('Pressed logs');
//                  }),
//                ],
//              ),
//            ),
                Builder(
                    builder: (context) => SafeArea(
                          child: widget._builder(context, child, model),
                        )),
              ],
            ),
          ),
        );

    if (widget.onModelReady != null) {
      widget.onModelReady(_model);
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelEnd != null) {
      widget.onModelEnd(_model);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<T>(
        model: _model,
        child: ScopedModelDescendant<T>(
          child: Container(color: Colors.red),
          builder: otherBuilder,
        ));
  }

  Widget getLeftButton({IconData icon, String label, Function() onPressed}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Icon(
            icon,
            semanticLabel: label,
          ),
          onPressed: onPressed,
        ),
      );
}
