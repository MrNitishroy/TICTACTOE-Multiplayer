import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Components/PrimaryButton.dart';
import 'package:tiktaktoe_multiplayer/Configs/AssetsPath.dart';
import 'package:tiktaktoe_multiplayer/Controller/RoomController.dart';
import 'package:tiktaktoe_multiplayer/Pages/LobbyPage/LobbyPage.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    RoomController roomController = Get.put(RoomController());
    TextEditingController roomId = TextEditingController();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(IconsPath.backIcon),
                ),
                SizedBox(width: 15),
                Text(
                  "Play With Private Room",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Enter Private Code And Join With Your Friend',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 20),
            TextField(
              controller: roomId,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                filled: true,
                hintText: "Enter Code Here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => roomController.isLoading.value
                  ? CircularProgressIndicator()
                  : PrimaryButton(
                      buttonText: "Join Now",
                      onTap: () {
                        if (roomId.text.isNotEmpty) {
                          roomController.joinRoom(roomId.text);
                        }
                      },
                    ),
            ),
            SizedBox(height: 80),
            Text(
              'Create private room',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Spacer(),
            Obx(
              () => roomController.isLoading.value
                  ? CircularProgressIndicator()
                  : PrimaryButton(
                      buttonText: "Create Room",
                      onTap: () {
                        roomController.createRoom();
                      },
                    ),
            ),
          ],
        ),
      ),
    ));
  }
}
