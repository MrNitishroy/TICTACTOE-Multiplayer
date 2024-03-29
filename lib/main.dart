import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Configs/PageRoute.dart';
import 'package:tiktaktoe_multiplayer/Configs/Theme.dart';
import 'package:tiktaktoe_multiplayer/Pages/RoomPage/RoomPage.dart';
import 'package:tiktaktoe_multiplayer/Pages/Splace/SplacePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: pages,
      debugShowCheckedModeBanner: false,
      title: 'Tik Tak Toe Multiplayer ',
      theme: lightTheme,
      // home: RoomPage(),
      home: SplacePage(),
    );
  }
}
