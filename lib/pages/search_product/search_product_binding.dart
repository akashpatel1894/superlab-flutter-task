import 'package:get/get.dart';

import 'search_product_logic.dart';

class SearchProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchProductLogic());
  }
}
