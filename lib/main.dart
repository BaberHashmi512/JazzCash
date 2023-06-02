import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/BottomNavigation.dart';
import 'Pages/helpers/MySharedPrefClass.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MySharedPrefClass.preferences = await SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const BottomNavigation()
      // BottomNavigation(),
    ),
  );
}
