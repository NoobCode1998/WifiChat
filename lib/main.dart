import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:ser/chat.dart';
import 'package:ser/server.dart';

String ip = "nothing";
void main() => runApp(Nav());

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
    // #docregion bind
    var server = await HttpServer.bind(
      "192.168.43.229",
      4040,
    );
    // #enddocregion bind

    // #docregion listen
    await for (var request in server) {
      String a = request.uri.toString();
      print("var a is ${a}");
      if (a == "/seCret") {
        a = "secret";
        text = "new valid request";

        reqs.add("secret");

        // setState(() {});
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
        reqs.add(a.substring(1, a.length));
        //  return a.substring(1, a.length);
        // setState(() {});

      }
      print("\n\n\n===============");
      print("server started");
      request.response.write('Hello, world!');
      print("reqs is ${reqs}");
      // var controller = new StreamController();
      //Stream onExit = controller.stream;
      //controller.add(reqs);

      await request.response.close();
    }
    // #enddocregion listen
  }

  List<String> reqs = ["first"];

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
      appBar: AppBar(title: Text("Nav Bar")),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: myController,
                    decoration:
                        InputDecoration(labelText: 'Enter your username'),
                  ),
                  RaisedButton.icon(
                      onPressed: () {
                        ip = myController.text;
                        print(
                            "==================\n\n\nip is $ip\n\n\n===========");
                      },
                      icon: Icon(Icons.accessible),
                      label: Text("add ip"))
                ],
              ),
            ),
            Scaffold(
              body: Text("Chat window"),
            ),
            first(),
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
          BottomNavyBarItem(title: Text('Server'), icon: Icon(Icons.home)),
          BottomNavyBarItem(title: Text('Item One'), icon: Icon(Icons.apps)),
          BottomNavyBarItem(
              title: Text('Item One'), icon: Icon(Icons.chat_bubble)),
          BottomNavyBarItem(
              title: Text('Item One'), icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}

class LastPage extends StatelessWidget {
  const LastPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child: Column());
  }
}

class first extends StatefulWidget {
  @override
  _firstState createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("First"),
    );
  }
}
