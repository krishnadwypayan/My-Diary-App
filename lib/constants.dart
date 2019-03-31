import 'package:flutter/material.dart';

final Color primaryColor = Color.fromRGBO(0, 94, 255, 10.0);
final Color backgroundColor = Colors.grey[100];
final Map<String, Color> moodColors = {
  "Very Happy" : Colors.green[400],
  "Happy" : primaryColor,
  "Good" : Colors.purple[800],
  "Bleh" : Colors.yellow[800],
  "Not So Great" : Colors.orange[800],
  "Sad" : Colors.grey[800],
};

final List<String> weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
final List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

String formatDate(DateTime date) {
  String weekday = date.difference(DateTime.now()).inDays == 0 ? 'Today' : weekdays[date.weekday-1];
  return '$weekday, ${months[date.month-1]} ${date.day}, ${date.year}';
}