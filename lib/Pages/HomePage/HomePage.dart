import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Components/PrimaryButtonWithIcon.dart';
import 'package:tiktaktoe_multiplayer/Configs/AssetsPath.dart';
import 'package:tiktaktoe_multiplayer/Controller/AuthController.dart';
import 'package:tiktaktoe_multiplayer/Controller/ProfileController.dart';
import 'package:tiktaktoe_multiplayer/Pages/Auth/AuthPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TIC TAC TOE",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "With Multiplayer",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(
              IconsPath.applogo,
              width: 200,
            ),
            Column(
              children: [
                PrimaryButtonWithIcon(
                  buttonText: "Single Player",
                  onTap: () {
                    Get.toNamed("/singlePlayer");
                  },
                  iconPath: IconsPath.user,
                ),
                SizedBox(height: 30),
                PrimaryButtonWithIcon(
                  buttonText: "Multi Player",
                  onTap: () {
                    Get.toNamed("/room");
                  },
                  iconPath: IconsPath.group,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SvgPicture.asset(
                      IconsPath.info,
                      width: 40,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SvgPicture.asset(
                      IconsPath.game,
                      width: 40,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SvgPicture.asset(
                      IconsPath.github,
                      width: 40,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    authController.auth.signOut();
                    Get.offAll(AuthPage());
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SvgPicture.asset(IconsPath.youtube, width: 40),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
