// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, avoid_init_to_null, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:property_management_system/core/model/property_model/property_model.dart';
import 'package:property_management_system/feature/add_screen/bloc/cubit/add_screen_cubit_cubit.dart';
import 'package:property_management_system/feature/home_screen/bloc/cubit/home_cubit.dart';
import 'package:property_management_system/feature/map_screen/map_screen.dart';
import 'package:property_management_system/injection_container.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'dart:convert';

import 'package:property_management_system/core/componets/components.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  double _values = 10000;

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
  void dispose() {
    sl<AddScreenCubit>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          if (fromkey.currentState!.validate()) {
            if (sl<AddScreenCubit>().fileList.isNotEmpty) {
              int index = sl<AddScreenCubit>().fileList.indexWhere(
                  (element) => element.state != ImageState.completed);
              if (index != -1) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("all images must be uploaded"),
                ));
              } else if (sl<AddScreenCubit>().latLng == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("must pick your proprty location"),
                ));
              } else {
                String imagePathes = '';
                for (int i = 0; i < sl<AddScreenCubit>().fileList.length; i++) {
                  imagePathes +=
                      sl<AddScreenCubit>().fileList[i].serverImagePath ?? "";
                  if (i < sl<AddScreenCubit>().fileList.length - 1) {
                    imagePathes += '@@';
                  }
                }

                sl<AddScreenCubit>().addProperty(PropertyModel(
                    bathroom: int.parse(bath_room_number.text),
                    bedroom: int.parse(bed_room_number.text),
                    description: descraption.text,
                    lan: sl<AddScreenCubit>().latLng!.longitude,
                    lat: sl<AddScreenCubit>().latLng!.latitude,
                    local: 'local.text',
                    name: name.text,
                    photo: imagePathes,
                    price: _values.ceil(),
                    propertyType: 'sss',
                    roomnumber: int.parse(
                      room_namber.text,
                    ),
                    state: state.text));
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("you must upload un image for your porperty"),
              ));
            }
          }
        },
        child: Icon(Icons.create),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 00.0,
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
                  BlocBuilder(
                      bloc: sl<AddScreenCubit>(),
                      builder: (context, state) {
                        return Container(
                          child: Text(
                            sl<AddScreenCubit>().latLng != null
                                ? "property location selected"
                                : "pick your location position",
                            style: TextStyle(
                                color: sl<AddScreenCubit>().latLng != null
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        );
                      }),
                  MaterialButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MapScreen(locationPicker: true),
                          ));
                    },
                    child: const Text("choose location"),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SfSlider(
                    min: 10000,
                    max: 100000,
                    value: _values,
                    showTicks: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (dynamic value) {
                      setState(() {
                        _values = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  BlocBuilder(
                    bloc: sl<AddScreenCubit>(),
                    builder: (context, state) {
                      if (sl<AddScreenCubit>().fileList.isNotEmpty)
                        return Container(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: FileImage(
                                                  sl<AddScreenCubit>()
                                                      .fileList[index]
                                                      .image))),
                                    ),
                                    Positioned(
                                      right: 3,
                                      top: 1,
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          )),
                                    ),
                                    BlocBuilder(
                                      bloc: sl<AddScreenCubit>(),
                                      builder: (context, state) {
                                        if (sl<AddScreenCubit>()
                                                .fileList[index]
                                                .state ==
                                            ImageState.uploading)
                                          return Positioned(
                                              bottom: 0,
                                              left: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 3,
                                                  color: Colors.greenAccent,
                                                ),
                                              ));
                                        if (sl<AddScreenCubit>()
                                                .fileList[index]
                                                .state ==
                                            ImageState.retry) {
                                          return Positioned(
                                              bottom: 3,
                                              child: InkWell(
                                                  onTap: () {
                                                    sl<AddScreenCubit>()
                                                        .reUpload(index);
                                                  },
                                                  child: Icon(
                                                    Icons.upload,
                                                    color: Colors.white,
                                                  )));
                                        }
                                        return const Offstage();
                                      },
                                    )
                                  ],
                                );
                              },
                              itemCount: sl<AddScreenCubit>().fileList.length),
                        );
                      return const Offstage();
                    },
                  ),
                  Row(
                    children: [
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
    var imageFile = await pickedFile.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      sl<AddScreenCubit>().uploadImage(imageFile);
    }

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    final ImagePicker pickedFile = ImagePicker();
    var imageFile = await pickedFile.pickImage(
      source: ImageSource.camera,
    );
    if (imageFile != null) {
      sl<AddScreenCubit>().uploadImage(imageFile);
    }
    Navigator.pop(context);
  }
}
