import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sheety_gui/scoped_model/base_model.dart';
import 'package:sheety_gui/scoped_model/settings_model.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/ui/views/list_view.dart';
import 'package:sheety_gui/ui/views/settings_view.dart';
import 'package:sheety_gui/ui/widgets/bottom_status.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final ScopedModelDescendantBuilder<T> _builder;
  final Function(T) onModelReady;
  final Function(T) onModelEnd;
  final Function(BuildContext, T) fab;
  final List<TopButton<T>> topButtons;

  BaseView(
      {GlobalKey<ScaffoldState> scaffoldKey,
      ScopedModelDescendantBuilder<T> builder,
      this.onModelReady,
      this.onModelEnd,
      this.fab,
      this.topButtons})
      : _scaffoldKey = scaffoldKey,
        _builder = builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>>
    with TickerProviderStateMixin {
  T _model = locator<T>();
  ScopedModelDescendantBuilder<T> otherBuilder;

  @override
  void initState() {
    otherBuilder = (context, child, BaseModel model) => Scaffold(
          resizeToAvoidBottomInset: true,
          key: widget._scaffoldKey,
          floatingActionButton: widget.fab?.call(context, model),
          body: BottomStatus(
            model: model,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: widget.topButtons.map((topButton) => getLeftButton(
                      icon: topButton.icon,
                      label: topButton.label,
                      onPressed: () => topButton.onPressed(model),
                  )).toList(),
                ),
                Builder(
                  builder: (context) =>
                      widget._builder?.call(context, child, model),
                ),
              ],
            ),
          ),
        );

    _model.init(this);
    widget.onModelReady?.call(_model);

    super.initState();
  }

  @override
  void dispose() {
    widget.onModelEnd?.call(_model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<T>(
      model: _model,
      child: ScopedModelDescendant<T>(
        child: Container(color: Colors.red),
        builder: otherBuilder,
      ),
    );
  }

  Widget getLeftButton({IconData icon, String label, Function() onPressed}) =>
      Padding(
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: IconButton(
          icon: Icon(
            icon,
            semanticLabel: label,
          ),
          onPressed: onPressed,
        ),
      );
}

class TopButton<T extends BaseModel> {
  BuildContext context;
  String label;
  IconData icon;
  String route;
  void Function(T) _onPressed;

  void Function(T) get onPressed => _onPressed ?? (_) =>
      Navigator.pushNamed(context, route);

  TopButton(this.context, this.label, this.icon, {this.route, void Function(T) onPressed}) : _onPressed = onPressed;

}
