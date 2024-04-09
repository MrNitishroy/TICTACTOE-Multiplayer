import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Configs/PageRoute.dart';
import 'package:tiktaktoe_multiplayer/Configs/Theme.dart';
import 'package:tiktaktoe_multiplayer/Pages/Splace/SplacePage.dart';
import 'package:tiktaktoe_multiplayer/Pages/UpdateProfile/UpdateProfile.dart';
import 'package:tiktaktoe_multiplayer/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: FToastBuilder(),
      getPages: pages,
      debugShowCheckedModeBanner: false,
      title: 'Tik Tak Toe Multiplayer',
      theme: lightTheme,
      home: SplacePage(),
    );
  }
}
 