import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sephora_flutter/route/route_management.dart';
import 'splash_screen_state.dart';

class SplashScreenLogic extends GetxController with SingleGetTickerProviderMixin {
  final SplashScreenState state = SplashScreenState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    state.animation = CurvedAnimation(
      parent: state.animationController!,
      curve: Curves.fastOutSlowIn,
    );
    state.animationController!.forward();

      Timer(const Duration(seconds: 3), () => RouteManagement.goToHome());

  }
}
