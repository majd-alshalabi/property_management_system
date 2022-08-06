// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, avoid_init_to_null, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'dart:convert';

import '../../core/componets/components.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late int value = 50000;

  final descraption = TextEditingController();
  final room_namber = TextEditingController();
  final state = TextEditingController();
  final price = TextEditingController();
  final local = TextEditingController();
  final photo = TextEditingController();
  final bath_room_number = TextEditingController();
  final bed_room_number = TextEditingController();
  final proparty_type = TextEditingController();

  final name = TextEditingController();
  var fromkey = GlobalKey<FormState>();

  XFile? imageFile = null;
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.black),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blueAccent,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black45,
        onPressed: () async {
          if (fromkey.currentState!.validate()) {
            File file = File(imageFile!.path);
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 00.0,
        title: Center(
            child: Text(
          "Add Proparty",
          style: TextStyle(color: Colors.black45),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Form(
              key: fromkey,
              child: Column(
                children: [
                  textAdd(
                    controller: name,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'Proparty Name',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textAdd(
                    controller: room_namber,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'RoomNamber',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textAdd(
                    controller: bath_room_number,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'BathRoomNumber',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textAdd(
                    controller: bed_room_number,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'BedRoomNumber',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textAdd(
                    controller: descraption,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'descraption',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textAdd(
                    controller: state,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'State',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textAdd(
                    controller: local,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'Local',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SfSlider(
                    min: 0.0,
                    max: 100000.0,
                    value: value,
                    interval: 20000,
                    showTicks: true,
                    showLabels: true,
                    numberFormat: NumberFormat("\$"),
                    activeColor: Colors.black54,
                    inactiveColor: Colors.black45,
                    minorTicksPerInterval: 1,
                    enableTooltip: true,
                    onChanged: (value) {
                      setState(() {
                        value = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Card(
                          child: (imageFile == null)
                              ? Text("")
                              : Image.file(
                                  File(imageFile!.path),
                                  width: 50.0,
                                  height: 50.0,
                                ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      MaterialButton(
                        textColor: Colors.white,
                        color: Colors.black45,
                        onPressed: () {
                          _showChoiceDialog(context);
                        },
                        child: const Text("Select Image"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openGallery(BuildContext context) async {
    // ignore: deprecated_member_use
    final ImagePicker pickedFile = ImagePicker();
    imageFile = await pickedFile.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {});

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    final ImagePicker pickedFile = ImagePicker();
    imageFile = await pickedFile.pickImage(
      source: ImageSource.camera,
    );
    setState(() {});
    Navigator.pop(context);
  }
}
