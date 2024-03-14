import 'package:flutter/material.dart';
import 'package:flutter_5iw1/custom_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      child: Builder(
        builder: (context) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Text(
                'Hello',
                style: CustomTheme.of(context).textStyleXS,
              ),
            ),
          );
        }
      ),
    );
  }
}
