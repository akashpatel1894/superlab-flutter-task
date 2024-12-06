import 'dart:io';

import 'package:sephora_flutter/service/service_locator.dart';
import '../constant/constant.dart';
import '../enum/endpoint.dart';
import '../enum/http_method.dart';
import '../model/search_product_model.dart';
import '../service/api_constant.dart';
import '../service/rest_api_service.dart';

class HomeRepository {
  final _apiService = locator<RestApiService>();
  var headerMap = {
    HttpHeaders.contentTypeHeader: Constant.contentType,
  };

  Future<List<Products>> getSearchProductListApi(
      Map<String, dynamic> requestData) async {
    var response = await _apiService.makeRestCall(
        headers: headerMap,
        ApiConstant.url,
        Endpoint.searchProduct,
        HttpMethod.Get,
        requestData,
        null);
    if (response.statusCode == 200) {
      var product = SearchProductModel.fromJson(response.data);
      return product.data?.products ?? [];
    } else {
      return [];
    }
  }
}
