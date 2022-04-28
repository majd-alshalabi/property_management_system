import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:property_management_system/feature/favorite_screen/favorite_screen.dart';
import 'package:property_management_system/feature/login_screen/login_screen.dart';
import 'package:property_management_system/feature/reigster/reigster_screen.dart';
import 'package:property_management_system/feature/splash_screen/slpash_screen.dart';
import 'package:property_management_system/injection_container.dart';

import 'feature/home_screen/home_screen.dart';

void main() {
  init();
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: Center(
              child: SpinKitSpinningLines(
            color: Colors.teal,
            size: 50.0,
          )),
          child: ReigsterScreen()),
    );
  }
}
