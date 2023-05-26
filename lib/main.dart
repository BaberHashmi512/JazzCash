import 'package:flutter/material.dart';
import 'Pages/BottomNavigation.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const BottomNavigation(),
    ),
  );
}
