import 'dart:io';
import 'dart:async';

main(List<String> args) async {
  print(args);

  // Connect to a web socket.
  final socket = await WebSocket.connect('ws://127.0.0.1:8080/ws');

  // Setup listening.
  socket.listen((message) {
    print('Message from server: $message');
  }, onError: (error) {
    print('error: $error');
  }, onDone: () {
    print('socket closed.');
  }, cancelOnError: true);

  // Add message
  Timer.periodic(Duration(seconds: 3), (timer) {
    if (socket.closeCode != null) {
      timer.cancel();
      return;
    }
    socket.add('Client Time is ${DateTime.now().toIso8601String()}.');
  });

  // Wait for the socket to close.
  try {
    await socket.done;
    print('WebSocket done');
  } catch (error) {
    print('WebScoket done with error $error');
  }
}
