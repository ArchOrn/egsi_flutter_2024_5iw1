import 'package:flutter/material.dart';
import 'package:flutter_5iw1/calendar_screen.dart';
import 'package:flutter_5iw1/favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screens = [
    ScreenDef(
      widget: const FavoritesScreen(),
      label: 'Favorites',
      icon: Icons.favorite,
    ),
    ScreenDef(
      widget: const CalendarScreen(),
      label: 'Today',
      icon: Icons.calendar_today,
    ),
    ScreenDef(
      widget: Container(
        color: Colors.purple,
        child: const Center(
          child: Text('Coucou'),
        ),
      ),
      label: 'User',
      icon: Icons.account_box,
    ),
  ];

  int _currentIndex = 0;

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
      backgroundColor: Colors.white,
      body: screens[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: screens.map((e) {
          return BottomNavigationBarItem(
            icon: Icon(e.icon),
            label: e.label,
          );
        }).toList(),
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

class ScreenDef {
  final Widget widget;
  final String label;
  final IconData icon;

  ScreenDef({required this.widget, required this.label, required this.icon});
}
