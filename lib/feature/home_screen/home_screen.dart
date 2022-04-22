import 'package:flutter/material.dart';
import 'package:property_management_system/core/Drawer/drawer.dart';
import 'package:property_management_system/core/constant/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: teal,
      ),
      drawer: AppDrawer(),
    );
  }
}
