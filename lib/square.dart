import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final Color color;

  const Square({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: color,
    );
  }
}
