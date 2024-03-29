import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tiktaktoe_multiplayer/Configs/AssetsPath.dart';
import 'package:tiktaktoe_multiplayer/Controller/SplaceController.dart';

class SplacePage extends StatelessWidget {
  const SplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          IconsPath.applogo,
          width: 150,
        ),
      ),
    );
  }
}
