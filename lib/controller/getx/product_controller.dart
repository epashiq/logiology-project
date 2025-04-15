// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:logiology_project/controller/services/product_services.dart';
// import 'package:logiology_project/model/product_model.dart';

// class ProductController extends GetxController {
//   final products = <Product>[].obs;
//   final isLoading = true.obs;
//   final isMoreLoading = false.obs;
//   final filteredProducts = <Product>[].obs;

//   final ProductServices productService = ProductServices();

//   final ScrollController scrollController = ScrollController();

//   int limit = 10;
//   int skip = 0;
//   bool hasMore = true;

//   var selectedCategory = ''.obs;
//   var selectedTag = ''.obs;
//   var maxPrice = 10000.0.obs;

//   @override
//   void onInit() {
//     fetchProductData();

//     scrollController.addListener(() {
//       if (scrollController.position.pixels >=
//               scrollController.position.maxScrollExtent - 100 &&
//           !isMoreLoading.value &&
//           hasMore) {
//         fetchMoreProducts();
//       }
//     });

//     super.onInit();
//   }

//   Future<void> fetchProductData() async {
//     try {
//       isLoading(true);
//       final result = await productService.getProducts(limit: limit, skip: skip);
//       products.assignAll(result.products);
//       skip += limit;
//       hasMore = result.products.length == limit;
//     } catch (e) {
//       Get.snackbar("Error", "Failed to load products");
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<void> fetchMoreProducts() async {
//     try {
//       isMoreLoading(true);
//       final result = await productService.getProducts(limit: limit, skip: skip);
//       products.addAll(result.products);
//       skip += limit;
//       hasMore = result.products.length == limit;
//     } catch (e) {
//       Get.snackbar("Error", "Failed to load more products");
//     } finally {
//       isMoreLoading(false);
//     }
//   }

//   Future<void> applyFilters() async {
//     filteredProducts.value = products.where((product) {
//       final matchCategory = selectedCategory.value.isEmpty ||
//           product.category == selectedCategory.value;
//       final matchTag =
//           selectedTag.value.isEmpty || product.tags.contains(selectedTag.value);
//       final matchPrice = product.price <= maxPrice.value;
//       return matchCategory && matchTag && matchPrice;
//     }).toList();
//   }

//   void setCategory(String category) {
//     selectedCategory.value = category;
//     applyFilters();
//   }

//   void setTag(String tag) {
//     selectedTag.value = tag;
//     applyFilters();
//   }

//   void setMaxPrice(double price) {
//     maxPrice.value = price;
//     applyFilters();
//   }

//   void clearFilters() {
//     selectedCategory.value = '';
//     selectedTag.value = '';
//     maxPrice.value = 10000;
//     applyFilters();
//   }
// }







import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology_project/model/product_model.dart';
import '../services/product_services.dart'; // And this service

class ProductController extends GetxController {
  final products = <Product>[].obs;
  final allProducts = <Product>[].obs;
  final searchProducts = <Product>[].obs;

  final isLoading = true.obs;
  final isMoreLoading = false.obs;

  final filterText = ''.obs;

  final selectedCategory = ''.obs;
final selectedTag = ''.obs;
final selectedPriceRange = ''.obs;

  final ProductServices productService = ProductServices();
  final ScrollController scrollController = ScrollController();

  int limit = 10;
  int skip = 0;
  bool hasMore = true;

  @override
  void onInit() {
    fetchProductData();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isMoreLoading.value &&
          hasMore) {
        fetchMoreProducts();
      }
    });
    super.onInit();
  }

  void fetchProductData() async {
    try {
      isLoading(true);
      final result = await productService.getProducts(limit: limit, skip: skip);
      products.assignAll(result.products);
      allProducts.assignAll(result.products);
      searchProducts.assignAll(result.products);
      skip += limit;
      hasMore = result.products.length == limit;
    } catch (e) {
      Get.snackbar("Error", "Failed to load products");
    } finally {
      isLoading(false);
    }
  }

  void fetchMoreProducts() async {
    try {
      isMoreLoading(true);
      final result = await productService.getProducts(limit: limit, skip: skip);
      products.addAll(result.products);
      allProducts.addAll(result.products);
      searchQuery(filterText.value);
      skip += limit;
      hasMore = result.products.length == limit;
    } catch (e) {
      Get.snackbar("Error", "Failed to load more products");
    } finally {
      isMoreLoading(false);
    }
  }

  void searchQuery(String query) {
    filterText.value = query;
    if (query.isEmpty) {
      searchProducts.assignAll(allProducts);
    } else {
      final filtered = allProducts.where((product) =>
          product.title.toLowerCase().contains(query.toLowerCase()) ||
          product.category.toLowerCase().contains(query.toLowerCase()));
      searchProducts.assignAll(filtered);
    }
  }


  void applyFilters() {
  List<Product> filtered = allProducts;

  if (selectedCategory.isNotEmpty) {
    filtered = filtered
        .where((p) => p.category.toLowerCase() == selectedCategory.value.toLowerCase())
        .toList();
  }

  if (selectedTag.isNotEmpty) {
    filtered = filtered
        .where((p) => p.tags.contains(selectedTag.value))
        .toList();
  }

  if (selectedPriceRange.isNotEmpty) {
    filtered = filtered.where((p) {
      final price = p.price;
      switch (selectedPriceRange.value) {
        case 'Under \$50':
          return price < 50;
        case '\$50 - \$100':
          return price >= 50 && price <= 100;
        case 'Above \$100':
          return price > 100;
        default:
          return true;
      }
    }).toList();
  }

  searchProducts.assignAll(filtered);
}

}
