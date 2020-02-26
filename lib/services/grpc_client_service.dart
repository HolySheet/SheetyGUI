import 'package:grpc/grpc.dart';
import 'package:sheety_gui/generated/holysheet_service.pbgrpc.dart';
import 'package:sheety_gui/generated/sheety_gui_service.pbgrpc.dart';

class GRPCClientService {
  ClientChannel channel;
  HolySheetServiceClient client;
  SheetyGUIServiceClient sheetyClient;

  /// Starts the gRPC server with the given port.
  Future<void> start([int port = 8999]) async {
    channel = ClientChannel('localhost',
        port: port,
        options:
        const ChannelOptions(credentials: ChannelCredentials.insecure(), connectionTimeout: Duration(minutes: 5)));
    client = HolySheetServiceClient(channel,
        options: CallOptions(timeout: Duration(hours: 10)));

    sheetyClient = SheetyGUIServiceClient(channel,
        options: CallOptions(timeout: Duration(hours: 10)));
  }
}
