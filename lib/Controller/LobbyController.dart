import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Models/RoomModel.dart';
import '../Configs/Messages.dart';

class LobbyController extends GetxController {
  final db = FirebaseFirestore.instance;
  RxInt watingTime = 5.obs;
  void copyRoomCode(String roomCode) {
    FlutterClipboard.copy(roomCode).then(
      (value) => successMessage("Copied"),
    );
  }

  Stream<RoomModel> getRoomDetails(String roomId) {
    return db.collection("rooms").doc(roomId).snapshots().map(
          (event) => RoomModel.fromJson(
            event.data()!,
          ),
        );
  }

  Future<void> startGame() async {
    watingTime.value = 5;
    while (watingTime.value > 0) {
      await Future.delayed(Duration(seconds: 1));
      watingTime.value--;
      print(watingTime.value);
    }
  }

  Future<void> updatePlayerStatus(String roomId, String status) async {
    await db.collection("rooms").doc(roomId).update(
      {
        "player2Status": status,
      },
    );
  }
}
