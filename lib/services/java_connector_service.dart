import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/error.dart';
import 'package:sheety_gui/services/payload/list_request.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:uuid/uuid.dart';

final Uuid _uuid = Uuid();

class JavaConnectorService {
  bool connected = false;

  Socket _socket;

  Map<String, Function(dynamic)> waiting = {};

  void send() {
      sendRequest(ListRequest('Query'), (ListResponse response) {
        print('response = $response');
      });
  }

  void connect() {
    print('Connecting...');

    socketStart((data) {
      var json = jsonDecode(data);
      var basicPayload = BasicPayload.fromJson(json);

      if (!basicPayload.type.receivable) {
        print('Received payload that is not receivable! ${basicPayload.type}');
        return;
      }

      var uuid = basicPayload.state;

      ({
        PayloadType.ERROR: () {
          var error = ErrorPayload.fromJson(json);
          print('Error received: ${error.message}\n${error.stacktrace}');

          waiting[uuid]?.call(error);
        },
        PayloadType.LIST_RESPONSE: () {
          var response = ListResponse.fromJson(json);
          print('Got list response!');

          waiting[uuid]?.call(response);
        }
      }[basicPayload.type])();
    });
  }

  void socketStart(Function(String) onReceive) async {
    _socket = await Socket.connect('localhost', 4567);
    print('Connected to: '
        '${_socket.remoteAddress.address}:${_socket.remotePort}');

    _socket.listen((input) {
      var string = String.fromCharCodes(input);
      onReceive(string);
    });
  }

  void sendRequest<T>(BasicPayload payload, Function(T) response) {
    var uuid = _uuid.v4();
    payload.state = uuid;
    write(jsonEncode(payload.toJson()));

    waiting[uuid] = (payload) {
      waiting.remove(uuid);
      response(payload);
    };
  }

  void write(String data) => _socket.writeln(data);
}
