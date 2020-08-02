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
      body: ListView.builder(
          itemCount: reqs.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Card(
                child: ListTile(
              title: Text(reqs[index].replaceAll("%20", " ")),
              subtitle: Text(sender[index]),
            ));
          }),
    );
  }
}
