# DartによるWebSocket Server, Clientのサンプル

## 参考

[DartのWebSocketのガイド](https://www.cresc.co.jp/tech/java/Google_Dart2/servers/websocket/websocket.html)

## 前提条件

下記の環境で動作することを確認しています.

1. Dartバージョン2.16.2.
2. Windows 10.

## 本プロジェクトの作成方法

1. 以下のコマンドでDartのコンソールアプリ用のプロジェクトを作成.

    `dart create --template console-full dart_websocket_sample`

    ここで,`dart_websocket_sample`はフォルダ名.

## コンパイル方法

1. 以下のコマンドでself-containedなexeを作成.

    - WebSocketサーバ用実行ファイル

        `dart compile exe bin\ws_svr.exe`

    - WebSocketクライアント用実行ファイル

        `dart compile exe bin\ws_clt.exe`

## 実行方法

1. WebSocketサーバを以下のコマンドで起動.

    `bin\ws_svr.exe`

2. WebSocketクライアントを以下のコマンドで起動.

    `bin\ws_clt.exe`
