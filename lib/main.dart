import 'package:flutter/material.dart';
import 'package:property_management_system/feature/home/home_page.dart';
import 'package:property_management_system/injection_container.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
