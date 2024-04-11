import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: Material(
            color: _color,
            child: InkWell(
              onTap: () {
                setState(() {
                  _color = _color == Colors.red ? Colors.blue : Colors.red;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
