import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Configs/AssetsPath.dart';
import 'package:tiktaktoe_multiplayer/Controller/AuthController.dart';
import 'package:tiktaktoe_multiplayer/Pages/RoomPage/RoomPage.dart';

import '../../Components/PrimaryButtonWithIcon.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLoading = false.obs;
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  IconsPath.applogo,
                  width: 200,
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Please sign in to continue.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 200,
            ),
            PrimaryButtonWithIcon(
              buttonText: "Sign in with Google",
              iconPath: IconsPath.google,
              onTap: () {
                authController.login();
              },
            ),
          ],
        ),
      ),
    );
  }
}
