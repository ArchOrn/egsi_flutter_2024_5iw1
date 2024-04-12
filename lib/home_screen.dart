import 'package:flutter/material.dart';
import 'package:flutter_5iw1/red_square.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            const RedSquare(),
            ...List.generate(100000, (index) {
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  RedSquare(),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
