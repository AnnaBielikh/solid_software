import 'dart:math';

import 'package:flutter/material.dart';

/// This class randomly generate RGB color
class GenerateColor {
  static final _random = Random();

  /// get randomly generate RGB color
  static Color getColor() => Color.fromARGB(
        255,
        _random.nextInt(255),
        _random.nextInt(255),
        _random.nextInt(255),
      );
}
