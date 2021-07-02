import 'dart:async';
import 'dart:io';
import 'routes.dart';

Future main() async {
  final HttpServer server;

  try {
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 1018);
  } catch (e) {
    print("Couldn't bind to port 1010: $e");
    exit(-1);
  }
  print('Listening on http://${server.address.address}:${server.port}/');

  await for (HttpRequest req in server) {
    Routes().handleRoutes(req);
  }
}
