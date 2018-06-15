import 'package:flutter/material.dart';
import 'package:fresh_air/helpers/BroadcastAPI.dart';

class ContactPage extends StatelessWidget {
  ContactPage({Key key}) : super(key: key);
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController messageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          margin: new EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                  hintText: 'Please enter your name.',
                ),
                controller: nameController,
              ),
              new TextField(
                decoration: new InputDecoration(
                  hintText: 'Please enter your message to the studio.',
                ),
                controller: messageController,
                maxLines: 5,
              ),
            ],
          ),
        ),
        new RaisedButton(
          child: new Text("Submit"),
          onPressed: () {
            DateTime now = new DateTime.now();
            String time = now.minute < 10
                ? "${now.hour.toString()}:0${now.minute
                .toString()}"
                : "${now.hour.toString()}:${now.minute.toString()}";
            String date = "${now.day}/${now.month}/${now.year}";
            BroadcastAPI.sendMessage(nameController.text,
                messageController.text, time, date);
          },
        ),
      ],
    );
  }
}