import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart'; // GetX package
import '../utils/colors.dart';

void showProgressbarDialog({Color? loaderColor}) {
  Future.delayed(Duration.zero, ()
  {
    if (!Get.isDialogOpen!) {
      Get.dialog(
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        Center(
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConst.black),
            child: const Stack(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SpinKitCircle(
                      size: 50,
                      color: ColorConst.themeColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        useSafeArea: true,
      );
    }
  });
}

void hideProgressDialog() {
  if (Get.isDialogOpen!) {
    Get.back();
  }
}
