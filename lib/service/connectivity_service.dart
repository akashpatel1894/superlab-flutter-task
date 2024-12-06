import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/constant.dart';
import '../utils/colors.dart';
import '../widget/custom_sizebox.dart';

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService();

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();

  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  bool _isConnected = false;

  Stream<bool> get connectivityStream => _controller.stream;

  static Future<ConnectivityService> getInstance() async {
    return _instance;
  }

  Future initialise() async {
    // Add the following line
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionState);
  }

  StreamSubscription<bool> listen(void Function(bool result)? onData) {
    return _controller.stream.listen(onData);
  }

  bool isConnected() {
    return _isConnected;
  }

  Future _updateConnectionState(ConnectivityResult result) async {
    _isConnected = result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
    _controller.add(_isConnected);

    if (result == ConnectivityResult.none) {
      if (Constant.isInitialize == true) {
        Get.dialog(
            barrierColor: ColorConst.themeColor,
            barrierDismissible: false,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off_rounded,
                        size: 100,
                        color: Colors.grey.withOpacity(0.35),
                      ),
                      hSpace(20),
                      // TitleTextView(
                      //   AppString.noInternet,
                      //   color: ColorConst.blackColor,
                      //   fontSize: 25,
                      //   fontWeight: FontWeight.w700,
                      //   fontStyle: FontStyle.normal,
                      // ),
                      // hSpace(10),
                      // TitleTextView(
                      //   AppString.checkInternet,
                      //   color: ColorConst.blackColor,
                      //   fontSize: 15,
                      //   fontWeight: FontWeight.w400,
                      //   fontStyle: FontStyle.normal,
                      // ),
                      // hSpace(30),
                      // SizedBox(
                      //     height: 55,
                      //     width: 220,
                      //     child: CustomButton(
                      //       bgColor: ColorConst.themeColor,
                      //       borderColor: Colors.transparent,
                      //       onTap: () {
                      //         if (result == ConnectivityResult.none) {
                      //           errorView(AppString.internetIsNotAvailable);
                      //         } else {
                      //           if (Get.isDialogOpen ?? false) Get.back();
                      //         }
                      //       },
                      //       text: 'Retry',
                      //       textColor: ColorConst.white,
                      //       fontSize: 20,
                      //     ))
                    ],
                  ),
                ),
              ],
            ));
      }
    } else {
      if (Get.isDialogOpen ?? false) Get.back();
    }
  }
}
