import 'package:async/async.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/grpc_client_service.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/settings_service.dart';
import 'package:sheety_gui/ui/views/list_view.dart';
import 'package:sheety_gui/ui/views/settings_view.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  setupLocator();

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final settingsService = locator<SettingsService>();
  final clientService = locator<GRPCClientService>();
  final javaConnectorService = locator<JavaConnectorService>();

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
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder(
              future: _memoizer.runOnce(() => javaConnectorService
                  .connect()
                  .then((_) => settingsService
                      .init()
                      .then((_) => clientService.start()))),
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
        '/settings': (context) => SettingsView(),
      },
    );
  }
}
