import 'package:angles/angles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sheety_gui/scoped_model/base_model.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/ui/widgets/busy_overlay.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final ScopedModelDescendantBuilder<T> _builder;
  final Function(T) onModelReady;
  final Function(T) onModelEnd;
  final Function(BuildContext, T) fab;

  BaseView({GlobalKey<ScaffoldState> scaffoldKey,
    ScopedModelDescendantBuilder<T> builder,
    this.onModelReady,
    this.onModelEnd,
    this.fab})
      : _scaffoldKey = scaffoldKey,
        _builder = builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> with SingleTickerProviderStateMixin {
  T _model = locator<T>();
  ScopedModelDescendantBuilder<T> otherBuilder;

  @override
  void initState() {
    otherBuilder = (context, child, BaseModel model) =>
        Scaffold(
          resizeToAvoidBottomInset: true,
          key: widget._scaffoldKey,
          floatingActionButton: widget.fab(context, model),
          body: Row(
            children: [
              Container(
                child: Card(
                  elevation: 5,
                  shape: ContinuousRectangleBorder(),
                  margin: EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: 36,
                          height: 36,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://lh3.googleusercontent.com/-3hnUnOvs4Pg/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3rc4nDtmlwLdIFlLDoVo1oiZGWyhnQ.CMID/photo.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ),
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
              Builder(
                builder: (context) => widget._builder(context, child, model),
              ),
            ],
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
