import 'package:flutter/material.dart';
import 'package:flutter_5iw1/home/b.dart';
import 'package:flutter_5iw1/home/c.dart';
import 'package:flutter_5iw1/home/home_screen.dart';
import 'package:flutter_5iw1/home/route_404.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/b': (context) => const B(),
      },
      onGenerateRoute: (settings) {
        final args = settings.arguments;
        switch (settings.name) {
          case '/c':
            return MaterialPageRoute(
              builder: (context) {
                return C(text: args as String);
              },
            );
          default:
            return MaterialPageRoute(
              builder: (context) {
                return const Route404();
              },
            );
        }
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
