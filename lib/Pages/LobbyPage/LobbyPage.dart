import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tiktaktoe_multiplayer/Components/PrimaryButton.dart';
import 'package:tiktaktoe_multiplayer/Components/UserCard.dart';
import 'package:tiktaktoe_multiplayer/Configs/AssetsPath.dart';
import 'package:tiktaktoe_multiplayer/Configs/Messages.dart';
import 'package:tiktaktoe_multiplayer/Controller/LobbyController.dart';
import 'package:tiktaktoe_multiplayer/Pages/GamePage/MultiPlayer.dart';
import 'package:tiktaktoe_multiplayer/Pages/LobbyPage/Widget/PricingArea.dart';
import 'package:tiktaktoe_multiplayer/Pages/LobbyPage/Widget/RoomInfo.dart';

class LobbyPage extends StatelessWidget {
  final String roomId;
  const LobbyPage({
    super.key,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    LobbyController lobbyController = Get.put(LobbyController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
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
                    const SizedBox(width: 15),
                    Text(
                      "Play With Private Room",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                RoomInfo(roomCode: roomId),
                const SizedBox(height: 40),
                StreamBuilder(
                  stream: lobbyController.getRoomDetails(roomId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      
                      return Column(
                        children: [
                          PriceArea(
                            entryPrice: snapshot.data!.entryFee!,
                            winningPrice: snapshot.data!.winningPrize!,
                          ),
                          const SizedBox(height: 90),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UserCard(
                                imgaeUrl: snapshot.data!.player1!.image!,
                                name: snapshot.data!.player1!.name!,
                                coins: "00",
                              ),
                              snapshot.data!.player2 == null
                                  ? Container(
                                      width: w / 2.6,
                                      child: Text("Wating for Other"),
                                    )
                                  : UserCard(
                                      imgaeUrl: snapshot.data!.player2!.image!,
                                      name: snapshot.data!.player2!.name!,
                                      coins: "00",
                                    ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Obx(
                            () => Text(
                              lobbyController.watingTime.value.toString(),
                            ),
                          ),
                          snapshot.data!.player1!.role == "admin"
                              ? PrimaryButton(
                                  buttonText: "Start Game",
                                  onTap: () {

                                  },
                                )
                              : snapshot.data!.player2Status == "wating"
                                  ? PrimaryButton(
                                      buttonText: "Ready",
                                      onTap: () async {
                                        lobbyController.updatePlayerStatus(
                                            roomId, "ready");
                                      },
                                    )
                                  : snapshot.data!.player2Status == "ready"
                                      ? PrimaryButton(
                                          buttonText: "Wating for start",
                                          onTap: () {},
                                        )
                                      : PrimaryButton(
                                          buttonText: "Start",
                                          onTap: () {},
                                        ),
                        ],
                      );
                    } else {
                      return Icon(Icons.error);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
