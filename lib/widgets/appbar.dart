import 'package:flutter/material.dart';

import '../constants/activeconstant.dart';

class AppbarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppbarComponent({Key? key, required this.title}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontFamily: "Poppins"),
      ),
      centerTitle: true,
      backgroundColor: activeColors.primary,
      elevation: 2,
    );
  }
}
