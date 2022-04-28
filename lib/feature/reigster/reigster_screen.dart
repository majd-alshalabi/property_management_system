import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_management_system/core/helper/http_helper.dart';
import 'package:property_management_system/core/model/register_model/register_params.dart';
import 'package:property_management_system/core/model/register_model/register_response.dart';
import 'package:property_management_system/feature/home_screen/home_screen.dart';
import 'package:property_management_system/feature/login_screen/login_screen.dart';
import 'package:property_management_system/feature/reigster/bloc/reigster_screen_bloc.dart';
import 'package:property_management_system/injection_container.dart';

import '../../core/componets/customBotton.dart';
import '../../core/componets/text_form_field.dart';
import '../../core/constant/colors.dart';

class ReigsterScreen extends StatefulWidget {
  const ReigsterScreen({Key? key}) : super(key: key);

  @override
  State<ReigsterScreen> createState() => _ReigsterScreenState();
}

class _ReigsterScreenState extends State<ReigsterScreen> {
  File? _image;
  final picker = ImagePicker();

  Future upGalleryImage(context) async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future upCameraImage(context) async {
    var pickedImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  // Future<void> selectedImageSource(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text(
  //             "Choose option",
  //             style: TextStyle(
  //               color: teal,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           content: SingleChildScrollView(
  //             child: ListBody(
  //               children: [
  //                 Divider(
  //                   height: 1,
  //                   color: teal,
  //                 ),
  //                 ListTile(
  //                   onTap: () {
  //                     upGalleryImage(context);
  //                   },
  //                   title: Text(
  //                     "Gallery",
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   leading: Icon(
  //                     Icons.account_box,
  //                     color: teal,
  //                   ),
  //                 ),
  //                 Divider(
  //                   height: 1,
  //                   color: teal,
  //                 ),
  //                 ListTile(
  //                   onTap: () {
  //                     upCameraImage(context);
  //                   },
  //                   title: Text(
  //                     "Camera",
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   leading: Icon(
  //                     Icons.camera,
  //                     color: teal,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  final formKey = GlobalKey<FormState>();
  bool isPassword = true;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    return Scaffold(
      body: BlocConsumer(
        bloc: sl<ReigsterScreenBloc>(),
        listener: (context, state) {
          if (state is ReigsterScreenLoaded) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          }
        },
        builder: (context, state) {
          if (state is ReigsterScreenLoading)
            return Center(child: CircularProgressIndicator());
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipPath(
                        child: Container(
                          width: width,
                          height: 220,
                          color: teal,
                        ),
                        clipper: WaveClipperOne(),
                      ),
                      Positioned(
                        top: 35,
                        left: width / 3.5,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                upGalleryImage(context);
                              },
                              onLongPress: () {
                                upCameraImage(context);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: white,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Svg('assets/images/gallary.svg'),
                                      ),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 9, offset: Offset(0, 5))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 150.0,
                    ),
                    child: const Text(
                      'Reigster',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: teal,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: defaultFormField(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
                      controller: usernameController,
                      hintText: 'Full Name',
                      prefix: Icons.person_rounded,
                      keyboard: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return "enter valid full name";
                        }
                      },
                      onTap: () {
                        return 'mm';
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: defaultFormField(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
                      controller: emailController,
                      hintText: 'Email',
                      prefix: Icons.email_outlined,
                      keyboard: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (value.length < 6) {
                          return 'too short';
                        }
                        if (value.contains('@') == false ||
                            value.contains('.') == false) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                      onTap: () {
                        return 'mm';
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: defaultFormField(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
                      controller: passwordController,
                      hintText: 'Password',
                      onTap: () {
                        return 'mm';
                      },
                      prefix: Icons.password,
                      isPassword: isPassword,
                      suffix:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      suffixPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      keyboard: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value.isEmpty) {
                          return value.length < 8
                              ? "Enter Password 6+ characters"
                              : null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        Card(
                          elevation: 10,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              constraints: const BoxConstraints.expand(
                                width: 30,
                                height: 30,
                              ),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/google.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Card(
                          elevation: 10,
                          child: OutlinedButton(
                            onPressed: () {
                              print("object");
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 5,
                                right: 5,
                                top: 10,
                                bottom: 10,
                              ),
                              constraints: const BoxConstraints.expand(
                                width: 30,
                                height: 30,
                              ),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: Svg(
                                      'assets/images/Facebook_icon_2013.svg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  if (state is ReigsterScreenError)
                    Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: teal,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  Stack(
                    children: [
                    ClipPath(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 170,
                        color: teal,
                      ),
                      clipper: WaveClipperTwo(
                        flip: true,
                        reverse: true,
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: 30,
                      child: CustomButton(
                        text: "Reigster",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            sl<ReigsterScreenBloc>()
                                .add(ReigsterScreenInitEvent());
                          }
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 45,
                      left: 30,
                      child: Column(
                        children: [
                          const Text(
                            "Alreafy have an Account ?",
                            style: TextStyle(
                              color: white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Acaslon Regular',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ));
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                color: white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Acaslon Regular',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
