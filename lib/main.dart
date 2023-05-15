import 'package:flutter/material.dart';
import 'package:jazzcash/Pages/FirstScreen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const FirstScreen(),
    ),
  );
}
