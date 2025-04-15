
import 'package:dio/dio.dart';
import 'package:logiology_project/model/product_model.dart';

class ProductServices {
  final dio = Dio();
  Future<ProductModel> getProducts({int limit = 10, int skip = 0}) async {
    try {
      final resp = await dio.get('https://dummyjson.com/products?limit=$limit&skip=$skip');
      if (resp.statusCode == 200) {
        return ProductModel.fromJson(resp.data);
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Failed to load products");
    }
  }
}
