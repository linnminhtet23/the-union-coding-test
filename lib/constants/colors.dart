import 'dart:ui' show Color;
import 'package:flutter/material.dart';

class KColors {
  final Color primary;
  final Color secondary;
  final Color backgroundColor;
  final Color progressColor;
  final Color swatchColor;
  final Color overlayColor;

  const KColors({
    required this.primary,
    required this.secondary,
    required this.backgroundColor,
        required this.progressColor,

    required this.swatchColor,
    required this.overlayColor,
  });
}

KColors colorScheme1 = const KColors(
  primary: Color.fromRGBO(13, 29, 66, 1),
  secondary: Color.fromRGBO(55, 55, 55, 1),
  backgroundColor: Color.fromRGBO(299, 299, 299, 1),
  progressColor: Color.fromRGBO(84, 167, 223, 1),
  swatchColor: Color.fromARGB(255, 3, 64, 105),
  overlayColor: Color.fromRGBO(14, 14, 14, 0.3),
);
