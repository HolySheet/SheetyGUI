import 'package:grpc/grpc.dart';
import 'package:sheety_gui/generated/holysheet_service.pbgrpc.dart';

class GRPCClientService {

  ClientChannel channel;
  HolySheetServiceClient client;

  Map<String, bool Function(CodeExecutionCallbackResponse)> callbacks = {};

  /// Starts the gRPC server with the given port.
  Future<void> start([int port = 8080]) async {
    channel = ClientChannel('localhost',
        port: port,
        options:
        const ChannelOptions(credentials: ChannelCredentials.insecure()));
    client = HolySheetServiceClient(channel,
        options: CallOptions(timeout: Duration(hours: 100000)));

    client.listenCallbacks(ListenCallbacksRequest()).listen((data) {
      print('callbackj!!!!! $data');
      if (callbacks[data.callbackState]?.call(data) ?? true) {
        removeCallback(data.callbackState);
      }
    });
//    await channel.shutdown();
  }

  /// Adds a function that is invoked whenever a callback is called with the
  /// given UUID is called. If the function returns true, the callback is
  /// removed and will no longer be called. If a callback already exists with
  /// the given UUID, it will be overridden.
  void addCallback(String uuid, bool Function(CodeExecutionCallbackResponse) callback) => callbacks[uuid] = callback;

  /// Adds multiple callbacks.
  /// See [addCallback]
  void addCallbacks(Map<String, bool Function(CodeExecutionCallbackResponse)> callbacks) => this.callbacks.addAll(callbacks);

  /// Removes a callback manually with the given UUID.
  void removeCallback(String uuid) => callbacks.remove(uuid);

}
