import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Pages/LobbyPage/LobbyPage.dart';
import 'package:tiktaktoe_multiplayer/Pages/RoomPage/RoomPage.dart';

var pages = [
  GetPage(
    name: "/room",
    page: () => RoomPage(),
  ),
  GetPage(
    name: "/lobby",
    page: () => LobbyPage(),
  ),
];
