import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';

class Message extends StatelessWidget {
  final String message;
  final double messageSize;

  const Message(
      {this.message = AppLabels.noNotes, required this.messageSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(message,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: messageSize)));
  }
}
