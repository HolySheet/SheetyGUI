import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/error_payload.dart';
import 'package:sheety_gui/services/payload/list_request.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:uuid/uuid.dart';

final Uuid _uuid = Uuid();

class JavaConnectorService {
  bool connected = false;

  Socket _socket;

  Map<String, Function(dynamic)> waiting = {};

  Future<ListResponse> send() async {
    var completer = Completer<ListResponse>();

      sendRequest(ListRequest('Query'), (ListResponse response) {
        print('response = $response');
        completer.complete(response);
      }, (error) {
        print('Error received while sending request: ${error.message}\n${error.stacktrace}');
    });

      return completer.future;
  }

  Future<void> connect() async {
    print('Connecting...');

    await socketStart((data) {
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

  Future<void> socketStart(Function(String) onReceive) async {
    _socket = await Socket.connect('localhost', 4567);
    print('Connected to: '
        '${_socket.remoteAddress.address}:${_socket.remotePort}');

    _socket.listen((input) {
      var string = String.fromCharCodes(input);
      onReceive(string);
    });
  }

  void sendRequest<T>(BasicPayload payload, Function(T) response, Function(ErrorPayload) error) {
    var uuid = _uuid.v4();
    payload.state = uuid;
    write(jsonEncode(payload.toJson()));

    waiting[uuid] = (payload) {
      waiting.remove(uuid);
      if (payload is ErrorPayload) {
        error(payload);
      } else {
        response(payload);
      }
    };
  }

  void write(String data) => _socket.writeln(data);
}
