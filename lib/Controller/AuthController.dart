import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiktaktoe_multiplayer/Configs/Messages.dart';
import 'package:tiktaktoe_multiplayer/Pages/HomePage/HomePage.dart';
import 'package:tiktaktoe_multiplayer/Pages/UpdateProfile/UpdateProfile.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;

  Future<void> login() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
      successMessage("Login Success");
      Get.to(UpdateProfile());
    } catch (e) {
      errorMessage("Login Failed");
      print(e);
    }
  }

  Future<void> updateProfile() async {
    Get.offAll(HomePage());
  }
}
