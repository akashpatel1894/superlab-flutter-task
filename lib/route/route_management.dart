import 'package:get/get.dart';

import 'route.dart';

class RouteManagement {

  static void goToHome() {
    Get.offNamed(RouteClass.home);
  }

  static void goToSearch() {
    Get.toNamed(RouteClass.searchProduct);
  }
}
