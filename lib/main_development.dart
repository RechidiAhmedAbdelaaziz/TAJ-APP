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
    variables: {
      "baseUrl": "https://tajalsafa-staging-20522007.dev.odoo.com/",
    },
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
