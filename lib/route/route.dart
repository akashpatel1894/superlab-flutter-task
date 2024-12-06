import 'package:get/get.dart';
import 'package:sephora_flutter/pages/home/home_binding.dart';
import 'package:sephora_flutter/pages/home/home_view.dart';
import 'package:sephora_flutter/pages/search_product/search_product_binding.dart';
import 'package:sephora_flutter/pages/search_product/search_product_view.dart';
import 'package:sephora_flutter/pages/splash_screen/splash_screen_binding.dart';
import 'package:sephora_flutter/pages/splash_screen/splash_screen_view.dart';

class RouteClass {
  static String splash = '/';
  static String home = '/home';
  static String searchProduct = '/searchProduct';

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
      transition: Transition.fade,
    ),

    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: searchProduct,
      page: () => SearchProductPage(),
      binding: SearchProductBinding(),
      transition: Transition.fade,
    ),
  ];
}
