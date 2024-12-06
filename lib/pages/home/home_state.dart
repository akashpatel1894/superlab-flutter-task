import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sephora_flutter/utils/image_string.dart';

class HomeState {

  final PageController  pageController = PageController();
  ScrollController scrollController = ScrollController();
  bool showBtn = false;

  int activePage = 0;
  late Timer timer;

  final List pages = [
    ImageString.banner1,
    ImageString.banner2,
    ImageString.banner3,
  ];

  final List product = [
    ImageString.product1,
    ImageString.product2,
    ImageString.product3,
    ImageString.product4,
    ImageString.product5
  ];
  HomeState() {
    ///Initialize variables
  }
}
