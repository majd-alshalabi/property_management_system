import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:property_management_system/feature/componets/customBotton.dart';
import 'package:property_management_system/feature/constant/colors.dart';

import '../componets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  color: Colors.teal,
                ),
                clipper: WaveClipperOne(),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 46.0),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 46.0),
                child: defaultFormField(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 55.0,
                  controller: emailController,
                  hintText: 'Email',
                  prefix: Icons.email_outlined,
                  keyboard: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value == '' || value.isEmpty) {
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
                padding: const EdgeInsets.only(left: 20.0, right: 46.0),
                child: defaultFormField(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 55.0,
                  controller: passwordController,
                  hintText: 'Password',
                  onTap: () {
                    return 'mm';
                  },
                  prefix: Icons.password,
                  isPassword: isPassword,
                  suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                  suffixPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  keyboard: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value.isEmpty) {
                      if (value == null || value == '' || value.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      if (value.length < 6) {
                        return 'too short';
                      }
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: teal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        constraints: const BoxConstraints.expand(
                          width: 40,
                          height: 40,
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/google.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Card(
                      elevation: 10,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        constraints: const BoxConstraints.expand(
                          width: 30,
                          height: 30,
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: Svg('assets/images/Facebook_icon_2013.svg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(children: [
                ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    color: Colors.red,
                  ),
                  clipper: WaveClipperTwo(
                    flip: true,
                    reverse: true,
                  ),
                ),
                Button(text: "login", onPressed: () {})
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
