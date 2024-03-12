import 'package:flutter/material.dart';
import 'package:solid_software/src/feature/generate_color/widget/generate_color_screen.dart';

/// Root widget of application
class App extends StatelessWidget {
  /// constructor
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GenerateColorScreen(),
    );
  }
}
