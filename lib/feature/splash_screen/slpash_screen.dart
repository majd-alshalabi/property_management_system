import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_management_system/feature/map_screen/map_screen.dart';
import 'package:property_management_system/feature/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:property_management_system/injection_container.dart';

import '../../core/constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    sl<SplashScreenBloc>().add(SplashScreenInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer(
        bloc: sl<SplashScreenBloc>(),
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: teal,
              ),
              if (state is SplashScreenRejectPermissionState)
                Positioned(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: size.width * 0.7,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Permission Needed',
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ),
                        Text(
                          'map Permission is needed so you can see the property location on map.',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            sl<SplashScreenBloc>().add(SplashScreenInitEvent());
                          },
                          child: Text(
                            'Add Permission',
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          );
        },
        listener: (BuildContext context, Object? state) {
          if (state is SplashScreenLoaded) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MapScreen(),
                ));
          }
        },
      ),
    );
  }
}
