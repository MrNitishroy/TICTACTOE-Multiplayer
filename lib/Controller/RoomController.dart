import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Configs/Messages.dart';
import 'package:tiktaktoe_multiplayer/Models/RoomModel.dart';
import 'package:tiktaktoe_multiplayer/Models/UserModel.dart';
import 'package:tiktaktoe_multiplayer/Pages/LobbyPage/LobbyPage.dart';
import 'package:uuid/uuid.dart';

class RoomController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  var uuid = Uuid();
  RxString roomCode = "".obs;
  RxBool isLoading = false.obs;
  Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  Future<void> createRoom() async {
    isLoading.value = true;
    String id = uuid.v4().substring(0, 8).toUpperCase();
    roomCode.value = id;
    var player1 = UserModel(
      id: user.value.id,
      name: user.value.name,
      image: user.value.image,
      email: user.value.email,
      totalWins: "0",
      yourTurn: "X",
      role: "admin",
    );
    var newRoom = RoomModel(
      id: id,
      entryFee: "10",
      winningPrize: "100",
      drawMatch: "",
      player1: player1,
      gameStatus: "lobby",
      player1Status: "wating",
      gameValue: ["", "", "", "", "", "", "", "", ""],
      isXturn: true,
    );
    try {
      await db.collection("rooms").doc(id).set(
            newRoom.toJson(),
          );
      Get.to(LobbyPage(roomId: id));
      successMessage("Done");
    } catch (e) {
      print(e);
      errorMessage("Error");
    }
    isLoading.value = false;
  }

  Future<void> getUserDetails() async {
    await db.collection("users").doc(auth.currentUser!.uid).get().then((value) {
      user.value = UserModel.fromJson(value.data()!);
    });
  }

  Future<void> joinRoom(String roomId) async {
    isLoading.value = true;
    var player2 = UserModel(
      id: user.value.id,
      name: user.value.name,
      image: user.value.image,
      email: user.value.email,
      totalWins: "0",
      yourTurn: "O",
      role: "player",
    );
    try {
      await db.collection("rooms").doc(roomId).update(
        {
          "player2": player2.toJson(),
          "player2Status": "wating",
        },
      );
      Get.to(LobbyPage(roomId: roomId));
      successMessage("Done");
    } catch (e) {
      print(e);
      errorMessage(e.toString());
    }
    isLoading.value = false;
  }
}
