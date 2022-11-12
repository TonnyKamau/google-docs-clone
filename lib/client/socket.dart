import 'package:google_docs_clone/constant.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketInstance {
  io.Socket? socket;
  static SocketInstance? _instance;
  SocketInstance._internal() {
    socket = io.io(host, <String, dynamic>{
      'transports': ['websockets'],
      'autoConnect': false,
    });
    socket!.connect();
  }
  static SocketInstance get instance {
    _instance ??= SocketInstance._internal();
    return _instance!;
  }
}
