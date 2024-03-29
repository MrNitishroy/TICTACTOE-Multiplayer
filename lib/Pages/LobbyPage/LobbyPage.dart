import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tiktaktoe_multiplayer/Components/PrimaryButton.dart';
import 'package:tiktaktoe_multiplayer/Components/UserCard.dart';
import 'package:tiktaktoe_multiplayer/Configs/AssetsPath.dart';
import 'package:tiktaktoe_multiplayer/Pages/GamePage/GamePage.dart';
import 'package:tiktaktoe_multiplayer/Pages/LobbyPage/Widget/PricingArea.dart';
import 'package:tiktaktoe_multiplayer/Pages/LobbyPage/Widget/RoomInfo.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(IconsPath.backIcon),
                    const SizedBox(width: 15),
                    Text(
                      "Play With Private Room",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const RoomInfo(roomCode: "23423"),
                const SizedBox(height: 40),
                const PriceArea(),
                const SizedBox(height: 90),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserCard(),
                    UserCard(),
                  ],
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  buttonText: "Start Game",
                  onTap: () {
                    Get.to(GamePage());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
