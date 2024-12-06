class SearchProductModel {
  int? statusCode;
  bool? success;
  Data? data;
  String? path;
  String? message;
  Meta? meta;

  SearchProductModel({
    this.statusCode,
    this.success,
    this.data,
    this.path,
    this.message,
    this.meta,
  });

  SearchProductModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    path = json['path'];
    message = json['message'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['path'] = path;
    data['message'] = message;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  List<Products>? products;
  List<Brands>? brands;
  List<Attributes>? attributes;
  RatingsCounts? ratingsCounts;

  Data({this.products, this.brands, this.attributes, this.ratingsCounts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(Brands.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    ratingsCounts = json['ratingsCounts'] != null
        ? RatingsCounts.fromJson(json['ratingsCounts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    if (ratingsCounts != null) {
      data['ratingsCounts'] = ratingsCounts!.toJson();
    }
    return data;
  }
}

class Products {
  String? id;
  String? title;
  String? subtitle;
  String? description;
  String? handle;
  double? weight;
  double? height;
  double? width;
  double? length;
  String? hsCode;
  String? originCountry;
  String? midCode;
  String? material;
  Metadata? metadata;
  String? createdAt;
  String? updatedAt;
  List<String>? tags;
  String? brandId;
  String? status;
  String? createdById;
  String? productCategoryId;
  String? thumbnail;
  String? productAttributeGroupId;
  String? metaTitle;
  String? metaDescription;
  Brand? brand;
  ProductCategory? productCategory;
  List<dynamic>? productCollections;
  List<ProductValuesForAttribute>? productValuesForAttribute;
  List<Variants>? variants;
  List<ProductImages>? productImages;
  List<Reviews>? reviews;
  Count? count;
  double? averageRating;
  int? priceStart;
  int? priceEnd;

  Products({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.handle,
    this.weight,
    this.height,
    this.width,
    this.length,
    this.hsCode,
    this.originCountry,
    this.midCode,
    this.material,
    this.metadata,
    this.createdAt,
    this.updatedAt,
    this.tags,
    this.brandId,
    this.status,
    this.createdById,
    this.productCategoryId,
    this.thumbnail,
    this.productAttributeGroupId,
    this.metaTitle,
    this.metaDescription,
    this.brand,
    this.productCategory,
    this.productCollections,
    this.productValuesForAttribute,
    this.variants,
    this.productImages,
    this.reviews,
    this.count,
    this.averageRating,
    this.priceStart,
    this.priceEnd,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    handle = json['handle'];
    weight = json['weight']?.toDouble();
    height = json['height']?.toDouble();
    width = json['width']?.toDouble();
    length = json['length']?.toDouble();
    hsCode = json['hs_code'];
    originCountry = json['origin_country'];
    midCode = json['mid_code'];
    material = json['material'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    tags = json['tags'].cast<String>();
    brandId = json['brandId'];
    status = json['status'];
    createdById = json['createdById'];
    productCategoryId = json['productCategoryId'];
    thumbnail = json['thumbnail'];
    productAttributeGroupId = json['productAttributeGroupId'];
    metaTitle = json['metaTitle'];
    metaDescription = json['metaDescription'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    productCategory = json['productCategory'] != null
        ? ProductCategory.fromJson(json['productCategory'])
        : null;
    if (json['productCollections'] != null) {
      productCollections = <dynamic>[];
      json['productCollections'].forEach((v) {
        productCollections!.add(v);
      });
    }
    if (json['productValuesForAttribute'] != null) {
      productValuesForAttribute = <ProductValuesForAttribute>[];
      json['productValuesForAttribute'].forEach((v) {
        productValuesForAttribute!.add(ProductValuesForAttribute.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
    if (json['productImages'] != null) {
      productImages = <ProductImages>[];
      json['productImages'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    count = json['_count'] != null ? Count.fromJson(json['_count']) : null;
    averageRating = json['averageRating']?.toDouble();
    priceStart = json['priceStart'];
    priceEnd = json['priceEnd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['description'] = description;
    data['handle'] = handle;
    data['weight'] = weight;
    data['height'] = height;
    data['width'] = width;
    data['length'] = length;
    data['hs_code'] = hsCode;
    data['origin_country'] = originCountry;
    data['mid_code'] = midCode;
    data['material'] = material;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['tags'] = tags;
    data['brandId'] = brandId;
    data['status'] = status;
    data['createdById'] = createdById;
    data['productCategoryId'] = productCategoryId;
    data['thumbnail'] = thumbnail;
    data['productAttributeGroupId'] = productAttributeGroupId;
    data['metaTitle'] = metaTitle;
    data['metaDescription'] = metaDescription;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (productCategory != null) {
      data['productCategory'] = productCategory!.toJson();
    }
    if (productCollections != null) {
      data['productCollections'] =
          productCollections!.map((v) => v.toJson()).toList();
    }
    if (productValuesForAttribute != null) {
      data['productValuesForAttribute'] =
          productValuesForAttribute!.map((v) => v.toJson()).toList();
    }
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    if (productImages != null) {
      data['productImages'] = productImages!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    if (count != null) {
      data['_count'] = count!.toJson();
    }
    data['averageRating'] = averageRating;
    data['priceStart'] = priceStart;
    data['priceEnd'] = priceEnd;
    return data;
  }
}

class Metadata {
  String? excerpt;

  Metadata({this.excerpt});

  Metadata.fromJson(Map<String, dynamic> json) {
    excerpt = json['excerpt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['excerpt'] = excerpt;
    return data;
  }
}

class Brand {
  String? id;
  String? title;
  String? description;
  String? handle;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? status;
  dynamic metadata;
  String? createdById;

  Brand({
    this.id,
    this.title,
    this.description,
    this.handle,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.status,
    this.metadata,
    this.createdById,
  });

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    handle = json['handle'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    status = json['status'];
    metadata = json['metadata'];
    createdById = json['createdById'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['handle'] = handle;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['status'] = status;
    data['metadata'] = metadata;
    data['createdById'] = createdById;
    return data;
  }
}

class ProductCategory {
  String? id;
  String? name;
  String? description;
  String? handle;
  String? image;
  String? parentId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? rank;
  String? fullPath;
  String? fullPathHandle;
  dynamic metadata;
  String? createdById;
  dynamic parent;

  ProductCategory({
    this.id,
    this.name,
    this.description,
    this.handle,
    this.image,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.rank,
    this.fullPath,
    this.fullPathHandle,
    this.metadata,
    this.createdById,
    this.parent,
  });

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    handle = json['handle'];
    image = json['image'];
    parentId = json['parentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    rank = json['rank'];
    fullPath = json['fullPath'];
    fullPathHandle = json['fullPathHandle'];
    metadata = json['metadata'];
    createdById = json['createdById'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['handle'] = handle;
    data['image'] = image;
    data['parentId'] = parentId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['rank'] = rank;
    data['fullPath'] = fullPath;
    data['fullPathHandle'] = fullPathHandle;
    data['metadata'] = metadata;
    data['createdById'] = createdById;
    data['parent'] = parent;
    return data;
  }
}

class ProductValuesForAttribute {
  String? id;
  String? productId;
  String? productAttributeId;
  String? productAttributeValueId;
  String? value;
  ProductAttribute? productAttribute;
  ProductAttributeValue? productAttributeValue;

  ProductValuesForAttribute({
    this.id,
    this.productId,
    this.productAttributeId,
    this.productAttributeValueId,
    this.value,
    this.productAttribute,
    this.productAttributeValue,
  });

  ProductValuesForAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    productAttributeId = json['productAttributeId'];
    productAttributeValueId = json['productAttributeValueId'];
    value = json['value'];
    productAttribute = json['productAttribute'] != null
        ? ProductAttribute.fromJson(json['productAttribute'])
        : null;
    productAttributeValue = json['productAttributeValue'] != null
        ? ProductAttributeValue.fromJson(json['productAttributeValue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productId'] = productId;
    data['productAttributeId'] = productAttributeId;
    data['productAttributeValueId'] = productAttributeValueId;
    data['value'] = value;
    if (productAttribute != null) {
      data['productAttribute'] = productAttribute!.toJson();
    }
    if (productAttributeValue != null) {
      data['productAttributeValue'] = productAttributeValue!.toJson();
    }
    return data;
  }
}

class ProductAttribute {
  String? id;
  String? title;
  String? type;
  String? code;
  bool? isRequired;
  bool? isUnique;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  dynamic metadata;
  String? createdById;

  ProductAttribute({
    this.id,
    this.title,
    this.type,
    this.code,
    this.isRequired,
    this.isUnique,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
    this.createdById,
  });

  ProductAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    code = json['code'];
    isRequired = json['isRequired'];
    isUnique = json['isUnique'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    metadata = json['metadata'];
    createdById = json['createdById'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['code'] = code;
    data['isRequired'] = isRequired;
    data['isUnique'] = isUnique;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['metadata'] = metadata;
    data['createdById'] = createdById;
    return data;
  }
}

class ProductAttributeValue {
  String? id;
  String? productAttributeId;
  String? value;
  int? position;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  dynamic metadata;

  ProductAttributeValue({
    this.id,
    this.productAttributeId,
    this.value,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  ProductAttributeValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productAttributeId = json['productAttributeId'];
    value = json['value'];
    position = json['position'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productAttributeId'] = productAttributeId;
    data['value'] = value;
    data['position'] = position;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['metadata'] = metadata;
    return data;
  }
}

class Variants {
  String? id;
  String? productId;
  String? title;
  String? sku;
  String? barcode;
  String? ean;
  String? upc;
  int? inventoryQuantity;
  bool? allowBackOrder;
  bool? manageInventory;
  String? hsCode;
  String? originCountry;
  String? midCode;
  String? material;
  double? weight;
  double? height;
  double? length;
  double? width;
  int? variantRank;
  int? price;
  int? specialPrice;
  String? specialPriceStartDate;
  String? specialPriceEndDate;
  int? inventory;
  dynamic metadata;
  String? createdAt;
  String? deletedAt;
  String? updatedAt;
  String? thumbnail;
  String? createdById;
  List<dynamic>? prices;
  int? originalPrice;
  int? currentPrice;
  SalePrices? salePrices;

  Variants({
    this.id,
    this.productId,
    this.title,
    this.sku,
    this.barcode,
    this.ean,
    this.upc,
    this.inventoryQuantity,
    this.allowBackOrder,
    this.manageInventory,
    this.hsCode,
    this.originCountry,
    this.midCode,
    this.material,
    this.weight,
    this.height,
    this.length,
    this.width,
    this.variantRank,
    this.price,
    this.specialPrice,
    this.specialPriceStartDate,
    this.specialPriceEndDate,
    this.inventory,
    this.metadata,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
    this.thumbnail,
    this.createdById,
    this.prices,
    this.originalPrice,
    this.currentPrice,
    this.salePrices,
  });

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    title = json['title'];
    sku = json['sku'];
    barcode = json['barcode'];
    ean = json['ean'];
    upc = json['upc'];
    inventoryQuantity = json['inventoryQuantity'];
    allowBackOrder = json['allowBackOrder'];
    manageInventory = json['manageInventory'];
    hsCode = json['hsCode'];
    originCountry = json['originCountry'];
    midCode = json['midCode'];
    material = json['material'];
    weight = json['weight']?.toDouble();
    height = json['height']?.toDouble();
    length = json['length']?.toDouble();
    width = json['width']?.toDouble();
    variantRank = json['variantRank'];
    price = json['price'];
    specialPrice = json['specialPrice'];
    specialPriceStartDate = json['specialPriceStartDate'];
    specialPriceEndDate = json['specialPriceEndDate'];
    inventory = json['inventory'];
    metadata = json['metadata'];
    createdAt = json['createdAt'];
    deletedAt = json['deletedAt'];
    updatedAt = json['updatedAt'];
    thumbnail = json['thumbnail'];
    createdById = json['createdById'];
    if (json['prices'] != null) {
      prices = <dynamic>[];
      json['prices'].forEach((v) {
        prices!.add(v);
      });
    }
    originalPrice = json['originalPrice'];
    currentPrice = json['currentPrice'];
    salePrices = json['salePrices'] != null
        ? SalePrices.fromJson(json['salePrices'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productId'] = productId;
    data['title'] = title;
    data['sku'] = sku;
    data['barcode'] = barcode;
    data['ean'] = ean;
    data['upc'] = upc;
    data['inventoryQuantity'] = inventoryQuantity;
    data['allowBackOrder'] = allowBackOrder;
    data['manageInventory'] = manageInventory;
    data['hsCode'] = hsCode;
    data['originCountry'] = originCountry;
    data['midCode'] = midCode;
    data['material'] = material;
    data['weight'] = weight;
    data['height'] = height;
    data['length'] = length;
    data['width'] = width;
    data['variantRank'] = variantRank;
    data['price'] = price;
    data['specialPrice'] = specialPrice;
    data['specialPriceStartDate'] = specialPriceStartDate;
    data['specialPriceEndDate'] = specialPriceEndDate;
    data['inventory'] = inventory;
    data['metadata'] = metadata;
    data['createdAt'] = createdAt;
    data['deletedAt'] = deletedAt;
    data['updatedAt'] = updatedAt;
    data['thumbnail'] = thumbnail;
    data['createdById'] = createdById;
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    data['originalPrice'] = originalPrice;
    data['currentPrice'] = currentPrice;
    if (salePrices != null) {
      data['salePrices'] = salePrices!.toJson();
    }
    return data;
  }
}

class SalePrices {
  SalePrices();

  SalePrices.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class ProductImages {
  String? id;
  String? productId;
  String? image;
  int? order;
  String? createdAt;
  String? updatedAt;
  String? createdById;
  String? productVariantId;

  ProductImages({
    this.id,
    this.productId,
    this.image,
    this.order,
    this.createdAt,
    this.updatedAt,
    this.createdById,
    this.productVariantId,
  });

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
    order = json['order'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdById = json['createdById'];
    productVariantId = json['productVariantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productId'] = productId;
    data['image'] = image;
    data['order'] = order;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['createdById'] = createdById;
    data['productVariantId'] = productVariantId;
    return data;
  }
}

class Reviews {
  int? rating;

  Reviews({this.rating});

  Reviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    return data;
  }
}

class Count {
  int? lineItems;

  Count({this.lineItems});

  Count.fromJson(Map<String, dynamic> json) {
    lineItems = json['lineItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lineItems'] = lineItems;
    return data;
  }
}

class Brands {
  String? id;
  String? handle;
  String? name;
  int? productCount;

  Brands({this.id, this.handle, this.name, this.productCount});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    handle = json['handle'];
    name = json['name'];
    productCount = json['productCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['handle'] = handle;
    data['name'] = name;
    data['productCount'] = productCount;
    return data;
  }
}

class Attributes {
  String? title;
  String? code;
  List<Values>? values;

  Attributes({this.title, this.code, this.values});

  Attributes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['code'] = code;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  String? value;
  int? productCount;

  Values({this.value, this.productCount});

  Values.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    productCount = json['productCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['productCount'] = productCount;
    return data;
  }
}

class RatingsCounts {
  int? i1;
  int? i2;
  int? i3;
  int? i4;
  int? i5;

  RatingsCounts({this.i1, this.i2, this.i3, this.i4, this.i5});

  RatingsCounts.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    i4 = json['4'];
    i5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = i1;
    data['2'] = i2;
    data['3'] = i3;
    data['4'] = i4;
    data['5'] = i5;
    return data;
  }
}

class Meta {
  int? total;
  int? items;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Meta({this.total, this.items, this.perPage, this.currentPage, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    items = json['items'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['items'] = items;
    data['perPage'] = perPage;
    data['currentPage'] = currentPage;
    data['lastPage'] = lastPage;
    return data;
  }
}

