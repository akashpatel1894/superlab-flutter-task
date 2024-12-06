import 'package:flutter/cupertino.dart';
import 'package:sephora_flutter/model/search_product_model.dart';

class SearchProductState {

  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  List<Products> productList = [];
  List recentSearch = [];

  bool isLoading = false;
  bool hasMoreData = true;
  bool isDataLoaded = false;

  int currentPage = 1;



  SearchProductState() {
    ///Initialize variables
  }
}
