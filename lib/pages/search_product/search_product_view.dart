import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sephora_flutter/model/search_product_model.dart';
import 'package:sephora_flutter/service/api_constant.dart';
import 'package:sephora_flutter/utils/app_string.dart';
import 'package:sephora_flutter/utils/colors.dart';
import 'package:sephora_flutter/utils/image_string.dart';
import 'package:sephora_flutter/widget/custom_text.dart';
import '../../encryptionDB/encryption_db.dart';
import '../../service/service_locator.dart';
import '../../widget/custom_sizebox.dart';
import 'search_product_logic.dart';
import 'search_product_state.dart';

class SearchProductPage extends StatelessWidget {
  SearchProductPage({super.key});

  final SearchProductLogic logic = Get.put(SearchProductLogic());
  final SearchProductState state = Get.find<SearchProductLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: logic,
      builder: (controller) => Scaffold(
        backgroundColor:
            state.productList.isEmpty ? ColorConst.bgColor : Colors.white,
        body: Column(
          children: [
            Container(
              height: 130,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 45),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.white,
                      ),
                    ),
                    wSpace(15),
                    Flexible(
                      child: CupertinoSearchTextField(
                        controller: state.searchController,
                        autofocus: true,
                        backgroundColor: Colors.white,
                        onSubmitted: (value) async {
                          if (state.searchController.text.trim().isNotEmpty) {
                            state.scrollController.addListener(logic.scrollListener);
                            await locator<SharedPrefServices>().addRecentSearch(value);
                            state.productList.clear();
                            logic.getSearchProduct(true);
                            logic.fetchRecentSearch();
                            logic.update();
                          }
                        },
                        onSuffixTap: () {
                          state.searchController.clear();
                          state.productList.clear();
                          state.currentPage = 1;
                          logic.update();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state.searchController.text.isEmpty)
              Flexible(child: recentSearchView(context)),
            Flexible(child: productListingView(context)),
          ],
        ),
      ),
    );
  }

  ///Recent Search View
  Widget recentSearchView(context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        if (state.recentSearch.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleTextView(
                  AppString.recentSearch,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
                InkWell(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    await locator<SharedPrefServices>().clearRecentSearches();
                    await logic.fetchRecentSearch();
                    logic.update();
                  },
                  child: TitleTextView(AppString.clear),
                )
              ],
            ),
          ),
        hSpace(10),
        Flexible(
          child: ListView.builder(
            itemCount: state.recentSearch.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              var recentSearch = state.recentSearch[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      state.scrollController.addListener(logic.scrollListener);
                      state.searchController.text = recentSearch;
                      state.productList.clear();
                      logic.getSearchProduct(true);
                      logic.update();
                    },
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: TitleTextView(
                              recentSearch,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            )),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 1,
                    color: Color(0xFFE0E0E0),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Widget productListingView(context) {
    return state.productList.isNotEmpty
        ? Column(
            children: [
              Flexible(
                child: AutoHeightGridView(
                    controller: state.scrollController,
                    itemCount: state.productList.length,
                    crossAxisCount: 2,
                    builder: (ctx, index) {
                      var detail = state.productList[index];
                      return productCardView(detail);
                    }),
              ),
              if (state.isLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SpinKitCircle(
                    color: ColorConst.black,
                    size: 35,
                  ),
                )
            ],
          )
        : state.searchController.text.isNotEmpty && state.isLoading == false
            ? SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: Center(
                  child: TitleTextView(
                    AppString.noDataFound,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              )
            : const SizedBox();
  }

  ///Recommended Card View
  Widget productCardView(Products product) {
    final imageUrl = product.thumbnail?.isNotEmpty ?? false
        ? ApiConstant.imgBaseUrl + product.thumbnail!
        : null;

    return Container(
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) => Container(
                        width: double.infinity,
                        height: 150,
                        alignment: Alignment.center,
                        color: Colors.grey[200],
                        child: const CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        ImageString.notImgFound,
                        fit: BoxFit.cover,
                      ),
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      ImageString.notImgFound,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          hSpace(10),
          SizedBox(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.title?.isNotEmpty ?? false)
                  TitleTextView(
                    product.title ?? "",
                    maxLines: 2,
                    fontWeight: FontWeight.w700,
                  ),
                hSpace(4),
                if (product.title?.isNotEmpty ?? false)
                  TitleTextView(
                    AppString.variants,
                    maxLines: 2,
                  ),
                hSpace(4),
                if (product.averageRating != 0)
                  Flexible(
                    child: Wrap(
                      spacing: 4.0, // Add spacing between stars
                      children: List.generate(5, (index) {
                        final double rating =
                            product.averageRating ?? 0;
                        if (index < rating.floor()) {
                          return const Icon(
                            Icons.star,
                            size: 15,
                            color: ColorConst.pink,
                          );
                        } else if (index < rating && index + 1 > rating) {
                          return const Icon(
                            Icons.star_half,
                            size: 15,
                            color: ColorConst.pink,
                          );
                        } else {
                          return const Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.grey,
                          );
                        }
                      }),
                    ),
                  )
                else
                  Flexible(
                    child: Wrap(
                      spacing: 4.0,
                      children: List.generate(5, (index) {
                        return const Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.grey,
                        );
                      }),
                    ),
                  ),
                hSpace(4),
                if (product.priceStart != 0)
                  TitleTextView(
                    'RS. ${product.priceStart}',
                    maxLines: 2,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
