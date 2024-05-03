import 'package:flutter/material.dart';
import 'package:flutter_5iw1/home/a.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const A();
                    },
                  ));
                },
                child: const Text('Go to A'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/b');
                },
                child: const Text('Go to B'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/c', arguments: 'toto');
                },
                child: const Text('Go to C'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cdgksndjkgnksdngjknsdg');
                },
                child: const Text('Go to 404'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
