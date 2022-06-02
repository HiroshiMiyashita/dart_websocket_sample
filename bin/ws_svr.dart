import 'dart:io';
import 'dart:async';

main(List<String> args) {
  print(args);

  HttpServer.bind('127.0.0.1', 8080).then((HttpServer server) {
    server
        .where((request) => request.uri.path == '/ws')
        .transform(WebSocketTransformer())
        .listen((WebSocket ws) {
      wsHandler(ws);
    });
    print("Server started");
  });
}

wsHandler(WebSocket ws) {
  print('new connection : ${ws.hashCode}');
  ws.listen((message) {
    print('Message from client(@${ws.hashCode}): ${message.toString()}');
  }, onDone: (() {
    print(
        'connection ${ws.hashCode} closed with ${ws.closeCode} for ${ws.closeReason}');
  }));

  Timer.periodic(Duration(seconds: 4), (timer) {
    if (ws.closeCode != null) {
      timer.cancel();
      return;
    }
    ws.add('Server time is ${DateTime.now().toIso8601String()}.');
  });
}
