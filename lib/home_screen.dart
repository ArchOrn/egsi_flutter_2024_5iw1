import 'package:flutter/material.dart';
import 'package:flutter_5iw1/square.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: const Icon(
          Icons.airplanemode_on,
          color: Colors.white,
        ),
        title: const Text(
          'My Title',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: _backgroundColor,
      body: Center(
        child: Square(
          onTap: () {
            setState(() {
              _backgroundColor = _backgroundColor == Colors.white ? Colors.black : Colors.white;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Today',
          ),
        ],
        selectedItemColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
