import 'package:get/get.dart';
import '../../encryptionDB/encryption_db.dart';
import '../../repository/home_repository.dart';
import '../../service/api_constant.dart';
import '../../service/rest_error.dart';
import '../../service/service_locator.dart';
import '../../widget/custom_loader.dart';
import '../../widget/custom_view_snackbar.dart';
import 'search_product_state.dart';

class SearchProductLogic extends GetxController {
  final SearchProductState state = SearchProductState();
  HomeRepository homeRepository = HomeRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchRecentSearch();
    state.scrollController.addListener(scrollListener);
  }

  Future<void> loadInitialProducts() async {
    state.currentPage = 1;
    state.hasMoreData = true;
    await getSearchProduct(true);
  }

  ///get recentSearch
  Future<void> fetchRecentSearch() async {
    state.recentSearch.clear();
    final recentSearch = await locator<SharedPrefServices>().getRecentSearches();
    state.recentSearch.addAll(recentSearch);
    update();
  }

  // Scroll listener for pagination
  void scrollListener() {
    if (state.scrollController.position.pixels ==
        state.scrollController.position.maxScrollExtent &&
        state.hasMoreData) {
      loadMoreProducts();
    }
  }

  Future<void> loadMoreProducts() async {
    state.currentPage++;
    await getSearchProduct(false);
  }

  Future<void> getSearchProduct(bool showLoader) async {
    state.hasMoreData = true;
    var requestMap = {
      ApiConstant.page: state.currentPage,
      ApiConstant.q: state.searchController.text,
    };
    if (state.isLoading) return;

    try {
      state.isLoading = true;
      if(showLoader) {
        showProgressbarDialog();
      }

      var centerContentData =
          await homeRepository.getSearchProductListApi(requestMap);

      if (centerContentData.isNotEmpty) {
        if (state.currentPage == 1) {
          state.productList.clear();
        }
        state.productList.addAll(centerContentData);
      } else {
        state.hasMoreData = false;
      }

      state.isDataLoaded = true;
      hideProgressDialog();
      update();
    } on RestError catch (error) {
      hideProgressDialog();
      errorView(error.message);
      update();
    } finally {
      state.isLoading = false;
      update();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    state.scrollController.dispose();
  }
}
