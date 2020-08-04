import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:ser/chat1.dart';
import 'package:ser/server.dart';

import 'chart.dart';

String ip = "Nothing";
String name = "";
String gateWay = " notYet";
void main() => runApp(Nav());
List<String> reqs = ["first"];
List<String> sender = ["first"];

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _pageController;

  final myController = TextEditingController();
  final myControllerName = TextEditingController();
  @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  String text = " ";

// Stream stream = controller.stream;
  Future serverStart() async {
    if (name.isEmpty || ip == "Nothing") {
      AwesomeDialog(
        context: context,
        headerAnimationLoop: false,
        dialogType: DialogType.NO_HEADER,
        title: 'Configure First',
        desc: 'Please configure ip and name first before starting server',
        btnOkOnPress: () {
          debugPrint('OnClcik');
        },
        btnOkIcon: Icons.check_circle,
      )..show();
    }
    // #docregion bind
    var server = await HttpServer.bind(
      ip,
      4040,
    );
    // #enddocregion bind

    // #docregion listen
    await for (var request in server) {
      String a = request.uri.toString();

      print("var a is ${a}");
      String vall = request.headers.toString();
      print(vall);
      print(vall.length);
      var start = (vall.indexOf("host") + 5);
      var ho = vall.substring(start, vall.lastIndexOf("0") + 1);
      print("\n\n\n\n${ho}\n\n\n\n\n");

      if (a == "/seCret") {
        a = "secret";
        text = "new valid request";

        reqs.add("secret");
        sender.add(ho);

        setState(() {});
      } else if (a == "/favicon.ico") {
        text = "unknown token";
      } else {
        AwesomeDialog(
          context: context,
          headerAnimationLoop: false,
          dialogType: DialogType.NO_HEADER,
          title: 'New Message',
          desc: 'New Message received',
          btnOkOnPress: () {
            debugPrint('OnClcik');
          },
          btnOkIcon: Icons.check_circle,
        )..show();

        //var sende = a.substring(1, a.length).indexOf("\$%25/") + 5;
        print(a);

        int st = a.indexOf("\$%25/");
        print("st is $st");
        //String sendarrr = a.substring(s);
        if (st >= 0) {
          sender.add(a.substring(st + 5, a.length));

          print("sender============================/n/n 1");
          sender.add("noone");
          reqs.add(a.substring(1, st));
          setState(() {});
        }
        //  return a.substring(1, a.length);
        // setState(() {});

      }
      print("\n\n\n===============");
      print("server started");
      request.response.write('Hello, from ${name}');
      print("reqs is ${reqs}");
      // var controller = new StreamController();
      //Stream onExit = controller.stream;
      //controller.add(reqs);

      await request.response.close();
    }
    // #enddocregion listen
  }

  @override
  void dispose() {
    _pageController.dispose();
    //  super.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("Wfi Chat")),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            ChatContain(),
            Server(
                myController: myController, myControllerName: myControllerName),
            LastPage(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: serverStart),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(title: Text('Chat'), icon: Icon(Icons.home)),
          BottomNavyBarItem(title: Text('Server'), icon: Icon(Icons.apps)),
          BottomNavyBarItem(
              title: Text('Others'), icon: Icon(Icons.chat_bubble)),
          BottomNavyBarItem(
              title: Text('Item One'), icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}

// class ChatContain extends StatefulWidget {
//   const ChatContain({
//     Key key,
//   }) : super(key: key);

//   @override
//   _ChatContainState createState() => _ChatContainState();
// }

// class _ChatContainState extends State<ChatContain> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//           itemCount: reqs.length,
//           itemBuilder: (BuildContext ctxt, int index) {
//             return Card(child: Text(reqs[index]));
//           }),
//     );
//   }
// }

class LastPage extends StatelessWidget {
  const LastPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child: Column());
  }
}

class SendMessage extends StatefulWidget {
  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("first Page")),
    );
  }
}
