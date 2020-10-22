import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // Dart allows changing the fields of a class, as any other OOP language. But
  // as this is a StatelessWidget it shouldn't change its properties from inside
  // thus, it's a convention to add final to properties.
  final String questionText;

  // Constructor
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Text(this.questionText);
  }
}