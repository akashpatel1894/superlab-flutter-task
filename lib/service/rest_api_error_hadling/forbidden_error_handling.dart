import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import '../../constant/constant.dart';
import '../../encryptionDB/encryption_db.dart';
import '../../utils/colors.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_sizebox.dart';
import '../../widget/custom_text.dart';
import '../rest_error.dart';
import '../service_locator.dart';

class ForbiddenErrorHandling {
  static bool canHandle(RestError error) {
    var statusCode = error.statusCode;

    return (statusCode != null && statusCode == HttpStatus.accepted);
  }

  static handle(RestError error) {
    _sessionLogoutDialog();
  }

  static _sessionLogoutDialog() {
    Get.dialog(
        barrierDismissible: false,
        barrierColor: Colors.black12,
        WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TitleTextView(
                        'Session Expired',
                        fontSize: 16,
                        color: ColorConst.red,
                      ),
                      hSpace(10),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: TitleTextView(
                          'Your session has expired\nYou will be redirected to the Login Page.',
                          textAlign: TextAlign.center,
                          fontSize: 14,
                          maxLines: 5,
                          color: ColorConst.black,
                        ),
                      ),
                      hSpace(20),
                      CustomButton(
                        width: Get.width,
                        onTap: () {
                          _logoutMethod();
                        },
                        text: 'Login',
                        textColor: Colors.white,
                        bgColor: ColorConst.themeColor,
                        borderColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }

  static _logoutMethod() async {
    locator<SharedPrefServices>().removeAll();
    Constant.selectedTabIndex = 0;
    Get.back();
    // RouteManagement.goToMobileScreen();
  }
}
