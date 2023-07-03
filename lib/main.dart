import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/bindings/main_bindings.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/get_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FFmpegKitConfig.init();
  // FFmpegKitConfig.enableLogCallback(logCallback);
  // FFmpegKitConfig.enableStatisticsCallback(null);
  // FFmpegKitConfig.(null);
  // FFmpegKitConfig.enableLogToFile(false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(fontFamily: 'Comfortaa'),
            debugShowCheckedModeBanner: false,
            getPages: AppPages.pages,
            initialBinding: MainBindings(),
            initialRoute: AppRoutes.splash,
          );
        }));
  }
}
