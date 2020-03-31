import 'package:flutter/material.dart';

Color primaryTagsColor(String field) {
  Color _tagColor;

  switch (field) {
    case "Mentor":
      _tagColor = Colors.red[800];
      break;
    case "Study Group":
      _tagColor = Colors.blue[700];
      break;
  }

  return _tagColor;
}

Color subTagsColor(String field) {
  Color _tagColor;
  switch (field) {
    case "Mathematics":
      _tagColor = Colors.red;
      break;
    case "Science":
      _tagColor = Colors.green;
      break;
    case "Engineering":
      _tagColor = Colors.blue[900];
      break;
    case "HASS":
      _tagColor = Colors.orange;
      break;
    case "Architecture":
      _tagColor = Colors.yellow;
      break;
    case "Business & MGMT":
      _tagColor = Colors.pink;
      break;
    default:
      _tagColor = Colors.grey;
      break;
  }

  return _tagColor;
}
