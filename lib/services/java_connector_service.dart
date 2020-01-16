//import 'dart:async';
//import 'dart:convert';
//import 'dart:io';
//
//import 'package:sheety_gui/service_locator.dart';
//import 'package:sheety_gui/services/payload_type.dart';
//import 'package:sheety_gui/services/settings_service.dart';
//import 'package:sheety_gui/utility.dart';
//import 'package:uuid/uuid.dart';
//
//final Uuid _uuid = Uuid();
//
//class JavaConnectorService {
//  static final _settings = locator<SettingsService>();
//  static const port = 4567;
//
//  final File jarPath;
//  final String _connectType;
//
//  Function(String) sendData;
//
//  Socket _socket;
//
//  Map<String, Request> waiting = {};
//
//  JavaConnectorService()
//      : jarPath = findHolySheet(),
//        _connectType = _settings.getSetting(Setting.backendConnect);
//
//  static File findHolySheet() =>
//      Directory.current.listSync().firstWhere((file) {
//        var name = file.uri.pathSegments.last;
//        return name.startsWith('HolySheet') && name.endsWith('.jar');
//      }, orElse: () => '${Directory.current}\\HolySheet.jar'.file());
//
//  Future<void> connect() async {
//    if (!(await jarPath.exists())) {
//      print('Couldn\'t find HolySheet jar at ${jarPath.path}');
//      exit(0);
//    }
//
//    print('Starting backend...');
//
//    switch (_connectType) {
//      case BackendConnect.ioStream:
//        final process = await Process.start('javaw', [
//          '-jar',
//          '--add-opens=jdk.jshell/jdk.jshell=ALL-UNNAMED',
//          jarPath.path,
//          '-p',
//          '$pid',
//          '-a',
//          'credentials.json',
//          '-i',
//          '-x',
//        ]);
//        process.stdout.transform(utf8.decoder).listen(_processData);
//        sendData = (data) => process.stdin.writeln(data);
//
//        print('Started Java process with PID of: ${process.pid}');
//        break;
//      case BackendConnect.socket:
//        final process = await Process.start('javaw', [
//          '-jar',
//          '--add-opens=jdk.jshell/jdk.jshell=ALL-UNNAMED',
//          jarPath.path,
//          '-s',
//          '$port',
//          '-p',
//          '$pid',
//          '-a',
//          'credentials.json',
//          '-x',
//        ]);
//        print('Started Java process with PID of: ${process.pid}');
//
//        sendData = (data) => _socket.writeln(data);
//        await socketStart(_processData);
//        break;
//    }
//  }
//
//  void _processData(String data) {
//    data = data.trim().replaceAll('\r\n', '\n');
//    // Cancel out anything that's probably not JSON
//    if (!data.startsWith('{')) {
//      if (data.isNotEmpty) {
//        print(data);
//      }
//      return;
//    }
//
//    var json = jsonDecode(data);
//    var basicPayload = BasicPayload.fromJson(json);
//
//    if (basicPayload.type == null) {
//      print(
//          'Received payload that is not receivable! ${basicPayload.type} (${basicPayload.type.type})');
//      return;
//    }
//
//    if (!basicPayload.type.receivable) {
//      print('Received payload that is not receivable! ${basicPayload.type}');
//      return;
//    }
//
//    var uuid = basicPayload.state;
//
//    var request = waiting[uuid];
//
//    if (request == null) {
//      return;
//    }
//
//    ({
//      PayloadType.ERROR: () => request.error(ErrorPayload.fromJson(json)),
//      PayloadType.LIST_RESPONSE: () =>
//          request.response(ListResponse.fromJson(json)),
//      PayloadType.UPLOAD_STATUS_RESPONSE: () => StatusableRequest.callResponse(
//          request, UploadStatusResponse.fromJson(json)),
//      PayloadType.DOWNLOAD_STATUS_RESPONSE: () =>
//          StatusableRequest.callResponse(
//              request, DownloadStatusResponse.fromJson(json)),
//      PayloadType.REMOVE_STATUS_RESPONSE: () => StatusableRequest.callResponse(
//          request, RemoveStatusResponse.fromJson(json)),
//      PayloadType.CODE_EXECUTION_RESPONSE: () =>
//          request.response(CodeExecutionResponse.fromJson(json)),
//      PayloadType.CODE_EXECUTION_CALLBACK_RESPONSE: () {
//        var response = CodeExecutionCallbackResponse.fromJson(json);
//        CallbackRequest.from(request)
//            ?.callback[response.callbackState]
//            ?.call(response);
//      },
//    }[basicPayload.type])();
//  }
//
//  Future<void> socketStart(Function(String) onReceive) async {
//    _socket = await Socket.connect('localhost', 4567);
//    print('Connected to: '
//        '${_socket.remoteAddress.address}:${_socket.remotePort}');
//
//    _socket.listen((input) {
//      var string = String.fromCharCodes(input);
//      onReceive(string);
//    });
//  }
//
//  /// Sends a [payload] request to the connected socket. The immediate response
//  /// paired with the given request type will be piped to [response]. For the
//  /// [CodeExecutionRequest], callbacks are available via [callback] with the
//  /// maps' key being the UUID of the callback. [error] is where errors are
//  /// piped to, and they are automatically logged (regardless of this function
//  /// being present) if [logError] is true. The [statusResponse] function is
//  /// invoked when a request's status response is invoked, meaning it could be
//  /// invoked an arbitrary amount of times. This property is only available for
//  /// request types that have [PayloadType.hasStatusResponse] true.
//  void sendRequest<T extends BasicPayload>(
//      {BasicPayload payload,
//      void Function(T) response,
//      void Function(T) statusResponse,
//      Map<String, Function(CodeExecutionCallbackResponse)> callback,
//      Function(ErrorPayload) error,
//      bool logError = false}) {
//    assert(callback == null || payload is CodeExecutionRequest,
//        'A callback can only be defined if a CodeExecutionRequest is being sent');
//    assert(statusResponse == null || payload.type.hasStatusResponse,
//        'statusResponse is only available for payload types that allow for them');
//    var uuid = _uuid.v4();
//    payload.state = uuid;
//    sendData(jsonEncode(payload.toJson()));
//
//    var usingError = error;
//    if (logError) {
//      if (error == null) {
//        usingError = (e) => print(
//            'Error received while sending request: ${e.message}\n${e.stacktrace}');
//      } else {
//        usingError = (e) {
//          print(
//              'Error received while sending request: ${e.message}\n${e.stacktrace}');
//          error(e);
//        };
//      }
//    }
//
//    if (statusResponse != null) {
//      waiting[uuid] = StatusableRequest(
//          response: (t) => response(t),
//          statusResponse: (t) => statusResponse(t),
//          error: usingError);
//    } else if (callback != null) {
//      waiting[uuid] = CallbackRequest(
//          response: (t) => response(t), callback: callback, error: usingError);
//    } else {
//      waiting[uuid] = BasicRequest(response: (payload) {
//        waiting.remove(uuid);
//        response(payload);
//      }, error: (payload) {
//        waiting.remove(uuid);
//        usingError?.call(payload);
//      });
//    }
//  }
//}
//
//abstract class Request {
//  void Function(dynamic) response;
//  void Function(ErrorPayload error) error;
//
//  Request(this.response, this.error);
//}
//
//class BasicRequest extends Request {
//  BasicRequest({Function(dynamic) response, Function(ErrorPayload) error})
//      : super(response, error);
//}
//
//class CallbackRequest<T> extends Request {
//  Map<String, Function(CodeExecutionCallbackResponse)> callback;
//
//  CallbackRequest(
//      {Function(dynamic) response, this.callback, Function(ErrorPayload) error})
//      : super(response, error);
//
//  static CallbackRequest from(dynamic request) {
//    return request is CallbackRequest ? request : null;
//  }
//}
//
///// A request that has status updates associated with them. These status
///// responses do not use the normal [response] function, as in the future
///// status and normal responses may be different, to allow for a easier
///// expandable protocol in the future.
//class StatusableRequest extends Request {
//  void Function(dynamic) statusResponse;
//
//  StatusableRequest(
//      {void Function(dynamic) response,
//      this.statusResponse,
//      Function(ErrorPayload) error})
//      : super(response, error);
//
//  static StatusableRequest from(dynamic request) {
//    return request is StatusableRequest ? request : null;
//  }
//
//  static callResponse(dynamic request, dynamic response) =>
//      from(request)?.statusResponse?.call(response);
//}
