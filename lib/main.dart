import 'package:flutter/material.dart';
import 'package:jazzcash/Pages/FirstScreen.dart';

import 'Pages/Locator.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    ),
  );
}
