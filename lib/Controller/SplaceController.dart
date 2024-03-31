import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Pages/HomePage/HomePage.dart';
import 'package:tiktaktoe_multiplayer/Pages/Welcome/WelcomePage.dart';

class SplaceController extends GetxController {
  final auth = FirebaseAuth.instance;
  @override
  void onInit() {
    splaceHandle();
    super.onInit();
  }

  Future<void> splaceHandle() async {
    await Future.delayed(const Duration(seconds: 3));
    if (auth.currentUser == null) {
      Get.offAll(WelcomePage());
    } else {
      Get.offAll(HomePage());
    }
  }
}
