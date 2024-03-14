import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Hello',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
