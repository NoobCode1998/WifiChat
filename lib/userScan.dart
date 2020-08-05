import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ScanUsers extends StatefulWidget {
  const ScanUsers({
    Key key,
  }) : super(key: key);

  @override
  _ScanUsersState createState() => _ScanUsersState();
}

class _ScanUsersState extends State<ScanUsers> {
  void scnForClient() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = 'http://192.168.0.103/';
    for (int i = 0; i < 100; i++) {
      url = "http://192.168.0." + i.toString() + "/";
      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          // var jsonResponse = convert.jsonDecode(response.body);
          //var itemCount = jsonResponse['totalItems'];
          //print('Number of books about http: $itemCount.');
          print(response.body);
          scan = !scan;
          setState(() {});
        } else {
          print('Request failed with status: ${response.statusCode}.');
        }
      } catch (a) {
        print("no response");
      }
    }

    // Await the http get response, then decode the json-formatted response.
    //   var response = await http.get(url);
    // if (response.statusCode == 200) {
    //   // var jsonResponse = convert.jsonDecode(response.body);
    //   //var itemCount = jsonResponse['totalItems'];
    //   //print('Number of books about http: $itemCount.');
    //   print(response.body);
    //   scan = !scan;
    //   setState(() {});
    // } else {
    //   print('Request failed with status: ${response.statusCode}.');
    // }
  }

  @override
  var scan = true;
  Widget build(BuildContext context) {
    return Scaffold(
        body: scan
            ? Center(
                child: RaisedButton(
                  child: Text("Scan for Clients"),
                  onPressed: scnForClient,
                ),
              )
            : Container(
                child: Center(child: Text("Scan completed")),
              ));
  }
}
