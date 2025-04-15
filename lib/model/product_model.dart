// // To parse this JSON data, do
// //
// //     final productModel = productModelFromJson(jsonString);

// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'dart:convert';

// part 'product_model.freezed.dart';
// part 'product_model.g.dart';

// ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

// String productModelToJson(ProductModel data) => json.encode(data.toJson());

// @freezed
// class ProductModel with _$ProductModel {
//     const factory ProductModel({
//         @JsonKey(name: "products")
//         required List<Product> products,
//         @JsonKey(name: "total")
//         required int total,
//         @JsonKey(name: "skip")
//         required int skip,
//         @JsonKey(name: "limit")
//         required int limit,
//     }) = _ProductModel;

//     factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
// }

// @freezed
// class Product with _$Product {
//     const factory Product({
//         @JsonKey(name: "id")
//         required int id,
//         @JsonKey(name: "title")
//         required String title,
//         @JsonKey(name: "description")
//         required String description,
//         @JsonKey(name: "category")
//         required String category,
//         @JsonKey(name: "price")
//         required double price,
//         @JsonKey(name: "discountPercentage")
//         required double discountPercentage,
//         @JsonKey(name: "rating")
//         required double rating,
//         @JsonKey(name: "stock")
//         required int stock,
//         @JsonKey(name: "tags")
//         required List<String> tags,
//         @JsonKey(name: "brand")
//         String? brand,
//         @JsonKey(name: "sku")
//         required String sku,
//         @JsonKey(name: "weight")
//         required int weight,
//         @JsonKey(name: "dimensions")
//         required Dimensions dimensions,
//         @JsonKey(name: "warrantyInformation")
//         required String warrantyInformation,
//         @JsonKey(name: "shippingInformation")
//         required String shippingInformation,
//         @JsonKey(name: "availabilityStatus")
//         required String availabilityStatus,
//         @JsonKey(name: "reviews")
//         required List<Review> reviews,
//         @JsonKey(name: "returnPolicy")
//         required String returnPolicy,
//         @JsonKey(name: "minimumOrderQuantity")
//         required int minimumOrderQuantity,
//         @JsonKey(name: "meta")
//         required Meta meta,
//         @JsonKey(name: "images")
//         required List<String> images,
//         @JsonKey(name: "thumbnail")
//         required String thumbnail,
//     }) = _Product;

//     factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
// }

// @freezed
// class Dimensions with _$Dimensions {
//     const factory Dimensions({
//         @JsonKey(name: "width")
//         required double width,
//         @JsonKey(name: "height")
//         required double height,
//         @JsonKey(name: "depth")
//         required double depth,
//     }) = _Dimensions;

//     factory Dimensions.fromJson(Map<String, dynamic> json) => _$DimensionsFromJson(json);
// }

// @freezed
// class Meta with _$Meta {
//     const factory Meta({
//         @JsonKey(name: "createdAt")
//         required DateTime createdAt,
//         @JsonKey(name: "updatedAt")
//         required DateTime updatedAt,
//         @JsonKey(name: "barcode")
//         required String barcode,
//         @JsonKey(name: "qrCode")
//         required String qrCode,
//     }) = _Meta;

//     factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
// }

// @freezed
// class Review with _$Review {
//     const factory Review({
//         @JsonKey(name: "rating")
//         required int rating,
//         @JsonKey(name: "comment")
//         required String comment,
//         @JsonKey(name: "date")
//         required DateTime date,
//         @JsonKey(name: "reviewerName")
//         required String reviewerName,
//         @JsonKey(name: "reviewerEmail")
//         required String reviewerEmail,
//     }) = _Review;

//     factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
// }


import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<Product> products;
  int total;
  int skip;
  int limit;

  ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Product {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  List<String> tags;
  String? brand;
  String sku;
  int weight;
  Dimensions dimensions;
  String warrantyInformation;
  String shippingInformation;
  String availabilityStatus;
  List<Review> reviews;
  String returnPolicy;
  int minimumOrderQuantity;
  Meta meta;
  List<String> images;
  String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"].toDouble(),
        discountPercentage: json["discountPercentage"].toDouble(),
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        tags: List<String>.from(json["tags"]),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"],
        availabilityStatus: json["availabilityStatus"],
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        returnPolicy: json["returnPolicy"],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: Meta.fromJson(json["meta"]),
        images: List<String>.from(json["images"]),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": tags,
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus": availabilityStatus,
        "reviews": reviews.map((x) => x.toJson()).toList(),
        "returnPolicy": returnPolicy,
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta.toJson(),
        "images": images,
        "thumbnail": thumbnail,
      };
}

class Dimensions {
  double width;
  double height;
  double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json["width"].toDouble(),
        height: json["height"].toDouble(),
        depth: json["depth"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
      };
}

class Meta {
  DateTime createdAt;
  DateTime updatedAt;
  String barcode;
  String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        barcode: json["barcode"],
        qrCode: json["qrCode"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
      };
}

class Review {
  int rating;
  String comment;
  DateTime date;
  String reviewerName;
  String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": comment,
        "date": date.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
      };
}

