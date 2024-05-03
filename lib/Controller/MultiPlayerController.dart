import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Models/RoomModel.dart';

class MultiPlayerController extends GetxController {
  final db = FirebaseFirestore.instance;
  Stream<RoomModel> getRoomDetails(String roomId) {
    return db.collection("rooms").doc(roomId).snapshots().map(
          (event) => RoomModel.fromJson(
            event.data()!,
          ),
        );
  }

  Future<void> updateData(String roomId, gameValue) async {
    await db.collection("rooms").doc(roomId).update({
      "gamevalue": gameValue,
    });
  }
}
