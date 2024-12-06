import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shopping_bag_logic.dart';
import 'shopping_bag_state.dart';

class ShoppingBagPage extends StatelessWidget {
  ShoppingBagPage({Key? key}) : super(key: key);

  final ShoppingBagLogic logic = Get.put(ShoppingBagLogic());
  final ShoppingBagState state = Get.find<ShoppingBagLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
