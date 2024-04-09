import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Pages/Auth/AuthPage.dart';
import 'package:tiktaktoe_multiplayer/Pages/GamePage/MultiPlayer.dart';
import 'package:tiktaktoe_multiplayer/Pages/GamePage/SinglePlayer.dart';
import 'package:tiktaktoe_multiplayer/Pages/HomePage/HomePage.dart';
import 'package:tiktaktoe_multiplayer/Pages/LobbyPage/LobbyPage.dart';
import 'package:tiktaktoe_multiplayer/Pages/RoomPage/RoomPage.dart';
import 'package:tiktaktoe_multiplayer/Pages/Splace/SplacePage.dart';
import 'package:tiktaktoe_multiplayer/Pages/UpdateProfile/UpdateProfile.dart';
import 'package:tiktaktoe_multiplayer/Pages/Welcome/WelcomePage.dart';

var pages = [
  GetPage(
    name: "/room",
    page: () => RoomPage(),
  ),
  GetPage(
    name: "/lobby",
    page: () => LobbyPage(),
  ),
  GetPage(
    name: "/auth",
    page: () => AuthPage(),
  ),
  GetPage(
    name: "/home",
    page: () => HomePage(),
  ),
  GetPage(
    name: "/splace",
    page: () => SplacePage(),
  ),
  GetPage(
    name: "/multiPlayer",
    page: () => MultiPlayer(),
  ),
  GetPage(
    name: "/updateProfile",
    page: () => UpdateProfile(),
  ),
  GetPage(
    name: "/welcome",
    page: () => WelcomePage(),
  ),
  GetPage(
    name: "/singlePlayer",
    page: () => SinglePlayer(),
  ),
];
