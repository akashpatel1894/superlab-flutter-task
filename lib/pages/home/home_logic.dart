import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.scrollController.addListener(() {
      double showoffset = 20.0;
      if(state.scrollController.offset > showoffset){
        state.showBtn = true;
        update();
      }else{
        state.showBtn = false;
       update();
      }
    });
    startAutoScroll();
  }

  void startAutoScroll() {
    state.timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (state.activePage < state.pages.length - 1) {
        state.activePage++;
      } else {
        state.activePage = 0;
      }
      state.pageController.animateToPage(
        state.activePage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    state.scrollController.dispose();
  }

}
