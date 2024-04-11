import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final VoidCallback onTap;

  const Square({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        color: Colors.red,
      ),
    );
  }
}
