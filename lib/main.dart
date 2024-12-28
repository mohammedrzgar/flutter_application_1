/// Exercise 3: Mobile Application Programming
/// Student Names: Mohammed rzgar,Dina Mohammed

import 'package:flutter/material.dart';

import 'app/service_locator.dart';
import 'screens/main/main_screen.dart';

void main() {
  initializeServiceLocator();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MAP Exercise 3',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MainScreen(),
  ));
}