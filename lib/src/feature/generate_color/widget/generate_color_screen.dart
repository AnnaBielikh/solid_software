import 'package:flutter/material.dart';
import 'package:solid_software/src/feature/generate_color/widget/colors_history_modal.dart';
import 'package:solid_software/src/utils/generate_color.dart';

/// Main Screen of generate color feature
class GenerateColorScreen extends StatefulWidget {
  /// constructor
  const GenerateColorScreen({super.key});

  @override
  State<GenerateColorScreen> createState() => _GenerateColorScreenState();
}

class _GenerateColorScreenState extends State<GenerateColorScreen> {
  late Color backgroundColor;
  final List<Color> backgroundColors = [];

  @override
  void initState() {
    backgroundColor = GenerateColor.getColor();
    backgroundColors.add(backgroundColor);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Color generation'),
      ),
      body: GestureDetector(
        onTap: _handleTapOnScreen,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          color: backgroundColor,
          child: Center(
            child: Text(
              'Hello there',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: const Icon(Icons.history),
      ),
    );
  }

  void _handleTapOnScreen() {
    setState(() {
      backgroundColor = GenerateColor.getColor();
      backgroundColors.add(backgroundColor);
    });
  }

  void _setColor({required Color color}) {
    setState(() {
      backgroundColor = color;
      backgroundColors.add(color);
    });
  }

  void _showDialog() {
    showModalBottomSheet(
      context: context,
      constraints: const BoxConstraints(minHeight: 200),
      builder: (BuildContext context) => ColorsHistoryModal(
        backgroundColors: backgroundColors,
        onTap: _setColor,
      ),
    );
  }
}
