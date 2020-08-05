import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class ChatContain extends StatefulWidget {
  const ChatContain({
    Key key,
  }) : super(key: key);

  @override
  _ChatContainState createState() => _ChatContainState();
}

class _ChatContainState extends State<ChatContain> {
  @override
  Widget build(BuildContext context) {
    // var reqs;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Expanded(
              child: ListView.builder(
                  itemCount: reqs.length - 1,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Card(
                        child: ListTile(
                      title: Text(reqs[index + 1].replaceAll("%20", " ")),
                      subtitle: Text(sender[index + 1]),
                    ));
                  })),
          new Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: new TextField(
                decoration: new InputDecoration(hintText: "Type in here!"),
              )),
        ],
      ),
    );
  }
}
