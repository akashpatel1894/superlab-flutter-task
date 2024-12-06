import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sephora_flutter/route/route_management.dart';
import 'package:sephora_flutter/utils/app_string.dart';
import 'package:sephora_flutter/utils/colors.dart';
import 'package:sephora_flutter/widget/custom_text.dart';
import '../../widget/custom_sizebox.dart';
import 'home_logic.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: logic,
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorConst.themeColor,
          body: Column(
            children: [
              Container(
                height: 150,
                color: ColorConst.black,
                padding: const EdgeInsets.only(top: 65, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                          Flexible(
                          child: InkWell(
                            onTap: (){
                              RouteManagement.goToSearch();
                            },
                            child: const CupertinoSearchTextField(
                              backgroundColor: Colors.white,
                              enabled: false,
                            ),
                          ),
                        ),
                        wSpace(20),
                        const Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                        ),
                        wSpace(20),
                        const Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    hSpace(12),
                    TitleTextView(
                      AppString.hiBty,
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  controller: state.scrollController,
                  child: Column(
                    children: [
                      pageView(context),
                      hSpace(10),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.product.length,
                          itemBuilder: (context, index) {
                            var img = state.product[index];
                            return productCardsView(
                              img: img,
                              productName: 'Product Name',
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 220,
                        color: Colors.grey.withOpacity(0.15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TitleTextView(
                                AppString.sc,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 140,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.product.length,
                                itemBuilder: (context, index) {
                                  var img = state.product[index];
                                  return productCardsView(
                                    img: img,
                                    productName: 'Product Name',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 330,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10,top: 20),
                              child: TitleTextView(
                                AppString.rfu,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.product.length,
                                itemBuilder: (context, index) {
                                  var img = state.product[index];
                                  return recommendedForYouCardView(
                                    img: img,
                                    productName: 'Product Name',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 220,
                        color: Colors.grey.withOpacity(0.15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TitleTextView(
                                AppString.sbb,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 140,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.product.length,
                                itemBuilder: (context, index) {
                                  var img = state.product[index];
                                  return productCardsView(
                                    img: img,
                                    productName: 'Product Name',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 330,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10,top: 20,right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleTextView(
                                    AppString.na,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  Row(
                                    children: [
                                      TitleTextView(
                                        'View All',
                                        fontSize: 12,
                                      ),
                                      const Icon(Icons.keyboard_arrow_right)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.product.length,
                                itemBuilder: (context, index) {
                                  var img = state.product[index];
                                  return recommendedForYouCardView(
                                    img: img,
                                    productName: 'Product Name',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: state.showBtn?1.0:0.0,
            child: FloatingActionButton(
              onPressed: () {
                state.scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve:Curves.fastOutSlowIn
                );
              },
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.arrow_upward),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }

  ///Page View
  Widget pageView(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
              controller: state.pageController,
              itemCount: state.pages.length,
              onPageChanged: (int page) {
                state.activePage = page;
                logic.update();
              },
              itemBuilder: (BuildContext context, int index) {
                return Image(
                  image: AssetImage(state.pages[index]),
                  fit: BoxFit.fill,
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              state.pages.length,
              (index) => buildDot(index, context),
            ),
          ),
        ),
      ],
    );
  }

  ///Product Card View
  Widget productCardsView({String? img, String? productName}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(image: AssetImage(img ?? '')),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          hSpace(5),
          SizedBox(
            width: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TitleTextView(
                productName ?? "",
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  ///Recommended Card View
  Widget recommendedForYouCardView({String? img, String? productName}){
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            height: 150,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(image: AssetImage(img ?? '')),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Icon(Icons.favorite_border),
          ),
          hSpace(5),
          TitleTextView(
            'SEPHORA EXCLUSIVE',
            maxLines: 2,
            fontSize: 9,
            color: ColorConst.pink,
          ),
          hSpace(4),
          TitleTextView(
            productName ?? "",
            maxLines: 2,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
          hSpace(4),
          SizedBox(
            width: 120,
            child: TitleTextView(
              'Soft Pinch Tinted Lip Oil',
              maxLines: 2,
              fontSize: 12,
            ),
          ),
          hSpace(4),
          TitleTextView(
            "\$2000",
            maxLines: 2,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
          hSpace(4),
           const Row(
            children: [
              Icon(Icons.star,size: 18,color: ColorConst.pink,),
              Icon(Icons.star,size: 18,color: ColorConst.pink,),
              Icon(Icons.star,size: 18,color: ColorConst.pink,),
              Icon(Icons.star,size: 18,color: ColorConst.pink,),
              Icon(Icons.star_half,size: 18,color: Colors.grey,),
            ],
          ),
          hSpace(4),
          SizedBox(
            width: 120,
            child: TitleTextView(
              "Happy (7 more Shade)",
              maxLines: 2,
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    // Another Container returned
    return Container(
      height: state.activePage == index ? 12 : 10,
      width: state.activePage == index ? 12 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (state.activePage == index)
            ? ColorConst.pink
            :  Colors.white.withOpacity(0.60),
      ),
    );
  }
}
