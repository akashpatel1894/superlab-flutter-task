enum Endpoint {
  searchProduct
}

extension EndpointExtension on Endpoint {
  String value() {
    switch (this) {
      case Endpoint.searchProduct:
        return '/store/product-search';

    }
  }
}
