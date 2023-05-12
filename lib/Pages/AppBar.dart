import 'package:flutter/material.dart';

class ApplicationToolBar extends StatefulWidget {
  const ApplicationToolBar({Key? key}) : super(key: key);

  @override
  State<ApplicationToolBar> createState() => _ApplicationToolBarState();
}

class _ApplicationToolBarState extends State<ApplicationToolBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      title: const Text(
        "JazzCash",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      elevation: 0,
      actions: const [
        Icon(Icons.help_outline),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
        Icon(Icons.menu),
      ],
    );
  }
}
