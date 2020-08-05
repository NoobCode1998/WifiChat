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
              child:
                  // new TextField(
                  //   decoration: new InputDecoration(hintText: "Type in here!"),
                  // )

                  TextChatRow()),
        ],
      ),
    );
  }
}

class TextChatRow extends StatefulWidget {
  const TextChatRow({
    Key key,
  }) : super(key: key);

  @override
  _TextChatRowState createState() => _TextChatRowState();
}

class _TextChatRowState extends State<TextChatRow> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Expanded(
            child: TextField(
                decoration: new InputDecoration(hintText: "Type in here!"))),
      ],
    );
  }
}
