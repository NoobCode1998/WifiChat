import 'dart:async';

import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/services.dart';
import 'package:gateway/gateway.dart';
import 'dart:io';
import 'package:get_ip/get_ip.dart';
import 'main.dart';
// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //       ),
// //       home: MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }

// class Server extends StatefulWidget {
//   Server({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _ServerState createState() => _ServerState();
// }

// class _ServerState extends State<Server> {
//   final myController = TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       child: Column(
//         children: <Widget>[
//           TextFormField(
//             controller: myController,
//             decoration: InputDecoration(labelText: 'Enter your username'),
//           ),
//           RaisedButton.icon(
//               onPressed: () {
//                 ip = myController.text;
//                 print("==================\n\n\nip is $ip\n\n\n===========");
//               },
//               icon: Icon(Icons.accessible),
//               label: Text("add ip")),

//         ],
//       ),
//     ));

//     // floatingActionButton: FloatingActionButton(
//     //   onPressed: server,
//     //   tooltip: 'start Server',
//     //   child: Text("Start server"),
//     //   // This trailing comma makes auto-formatting nicer for build methods.
//     // )
//   }
// }

class Server extends StatefulWidget {
  const Server({Key key, @required this.myController, this.myControllerName})
      : super(key: key);

  final TextEditingController myController;
  final TextEditingController myControllerName;

  @override
  _ServerState createState() => _ServerState();
}

class _ServerState extends State<Server> {
  String _ip = 'Unknown';

//  void initState() {
//     super.initState();
//     initPlatformState();
//   }

  Future<void> initPlatformState() async {
    String ipAddress;

    Gateway gt = await Gateway.info;
    print("======================================");
    print(gt.netmask);

    gateWay = gt.toString();

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      ipAddress = await GetIp.ipAddress;
    } on PlatformException {
      ipAddress = 'Failed to get ipAddress.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ip = ipAddress;
      widget.myController.text = _ip;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: widget.myController,
              decoration: InputDecoration(labelText: 'Enter your IP address'),
            ),
          ),
          RaisedButton.icon(
              onPressed: () {
                ip = widget.myController.text;
                print("==================\n\n\nip is $ip\n\n\n===========");
              },
              icon: Icon(Icons.accessible),
              label: Text("add ip")),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: initPlatformState,
            child: Text("GetIp"),
          ),
          Container(child: Text(_ip)),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text("Enter your name"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: widget.myControllerName,
              decoration:
                  InputDecoration(labelText: 'Enter your Name for Messaging '),
            ),
          ),
          RaisedButton(
            onPressed: () {
              name = widget.myControllerName.text;
              print("Name is : $name");
            },
            child: Text("Submit Name"),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Text("Gate Way is $gateWay"),
          )
        ],
      ),
    );
  }
}
