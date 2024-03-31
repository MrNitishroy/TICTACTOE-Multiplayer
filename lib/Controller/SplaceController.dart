import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Pages/Welcome/WelcomePage.dart';

class SplaceController extends GetxController {
  @override
  void onInit() {
    splaceHandle();
    super.onInit();
  }

  Future<void> splaceHandle() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(WelcomePage());
  }
}
