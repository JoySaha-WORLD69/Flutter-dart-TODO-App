import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Boldtext extends StatelessWidget {
  Boldtext({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.size = 20,
    this.fontWeight,
    required this.check,
  });

  String text;
  Color? color;
  double size;
  FontWeight? fontWeight;
  bool check;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
        decoration: check ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}
