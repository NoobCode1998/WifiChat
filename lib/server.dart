import 'dart:async';

import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:io';
import 'main.dart';
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class Server extends StatefulWidget {
  Server({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ServerState createState() => _ServerState();
}

class _ServerState extends State<Server> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Text("Server page"),
    ));

    // floatingActionButton: FloatingActionButton(
    //   onPressed: server,
    //   tooltip: 'start Server',
    //   child: Text("Start server"),
    //   // This trailing comma makes auto-formatting nicer for build methods.
    // )
  }
}
