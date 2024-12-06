import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

SnackbarController snackBarView(
    String title, String mMessage, Icon icon, Color bgColor, Color textColor) {
  return Get.snackbar(title, mMessage,
      animationDuration: 500.milliseconds,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      icon: icon,
      backgroundColor: bgColor,
      colorText: textColor);
}
