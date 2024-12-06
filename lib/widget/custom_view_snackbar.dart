import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';
import '../utils/colors.dart';
import '../utils/error_string.dart';
import 'custom_snackbar.dart';

SnackbarController errorView(String message) {
  return snackBarView(
      ErrorMessages.error,
      message,
      const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      Colors.red,
      Colors.white,
  );
}

SnackbarController successView(message){
  return snackBarView(
      'Successfully',
      message,
      const Icon(
        Icons.task_alt,
        color: Colors.white,
      ),
      ColorConst.green,
      Colors.white);
}
