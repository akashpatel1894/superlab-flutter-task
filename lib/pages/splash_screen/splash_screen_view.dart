import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sephora_flutter/utils/colors.dart';
import 'package:sephora_flutter/utils/image_string.dart';
import 'splash_screen_logic.dart';
import 'splash_screen_state.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});

  final SplashScreenLogic logic = Get.put(SplashScreenLogic());
  final SplashScreenState state = Get.find<SplashScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: logic,
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorConst.black,
          body: ScaleTransition(
            scale: state.animation!,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Center(child: Image(image: AssetImage(ImageString.logoImg)))
              ],
            ),
          ),
        );
      },
    );
  }
}
