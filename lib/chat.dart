import 'dart:async';

import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();
  List<String> reqs = ["first"];
  final ChatUser user = ChatUser(
    name: "Fayeed",
    firstName: "Fayeed",
    lastName: "Pawaskar",
    uid: "12345678",
    avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  );

  final ChatUser otherUser = ChatUser(
    name: "Mrfatty",
    uid: "25649654",
  );

  List<ChatMessage> messages = List<ChatMessage>();
  var m = List<ChatMessage>();

  @override
  void initState() {
    super.initState();
    //  final mystream = controller.listen((data) => reqs.add(data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Chat window"),
    );
  }
}
