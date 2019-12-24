import 'package:async/async.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/ui/views/list_view.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  setupLocator();

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final connectorService = locator<JavaConnectorService>();

  final _memoizer = AsyncMemoizer<dynamic>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HolySheet',
      theme: ThemeData(
//        brightness: Brightness.dark,
          fontFamily: 'Roboto',
      ),
      home: FutureBuilder(
        future: _memoizer.runOnce(() async => connectorService.connect()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Center(child: CircularProgressIndicator()));
            default:
              if (snapshot.data == null) {
                return FileListView(); // Usually show login
              } else {
                return FileListView();
              }
          }
        },
      ),
    );
  }
}
