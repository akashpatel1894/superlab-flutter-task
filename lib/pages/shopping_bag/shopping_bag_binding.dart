import 'package:get/get.dart';

import 'shopping_bag_logic.dart';

class ShoppingBagBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShoppingBagLogic());
  }
}
