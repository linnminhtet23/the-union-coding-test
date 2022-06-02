import 'package:flutter/material.dart';

import 'activeconstant.dart';

class KTextStyles {
  final TextStyle mainHeader;
  final TextStyle splashscreenHeader;
  final TextStyle splashscreenSubHeader;
  final TextStyle authHeader;
  final TextStyle labelText;

  const KTextStyles({
    required this.mainHeader,
    required this.splashscreenHeader,
    required this.splashscreenSubHeader,
    required this.authHeader,
    required this.labelText,
  });
}

KTextStyles textStyles1 = KTextStyles(
    mainHeader: const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 30.0,
      color: Colors.black,
    ),
    splashscreenHeader: const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      color: Colors.white,
    ),
    splashscreenSubHeader: const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
      color: Colors.white,
    ),
    authHeader: const TextStyle(
      fontFamily: 'Poppins',
      // fontWeight: FontWeight.bold,
      fontSize: 28.0,
      color: Colors.black,
    ),
    labelText: TextStyle(
      color: activeColors.primary,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ));
