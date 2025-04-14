import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/app.dart';
import 'package:taj_elsafa/core/di/locator.dart';

void main() async {
  // Define the flavor
  FlavorConfig(
    name: "DEVELOPMENT MOBILE",
    variables: {"baseUrl": "http://192.168.1.9:3000/api/v1"},
  );

  // Initialize the ScreenUtil
  WidgetsFlutterBinding.ensureInitialized();


  // Setup the dependency injection
  await setupLocator();

  // Ensure the screen size is set
  await ScreenUtil.ensureScreenSize();

  // Set the preferred orientations
  // This is important to ensure the app runs in portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const TajApp());
}
