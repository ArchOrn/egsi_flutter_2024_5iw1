import 'package:flutter/material.dart';

class CustomTheme extends InheritedWidget {
  final textStyleXS = const TextStyle(
    color: Colors.purple,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  const CustomTheme({
    super.key,
    required super.child,
  });

  static CustomTheme of(BuildContext context) {
    final CustomTheme? result = context.dependOnInheritedWidgetOfExactType<CustomTheme>();
    assert(result != null, 'No CustomTheme found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CustomTheme old) {
    return true;
  }
}
