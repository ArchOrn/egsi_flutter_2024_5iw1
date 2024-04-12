import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('First Name $index Last Name $index'),
              subtitle: Text('$index, rue du Faubourg St Antoine'),
              leading: const Icon(Icons.person),
              onTap: () {},
            );
          },
          itemCount: 100000,
        ),
      ),
    );
  }
}
