import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology_project/model/product_model.dart';
import '../services/product_services.dart';

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

  final categories = <String>[].obs;
  final tags = <String>[].obs;

  final priceRanges = [
    'All',
    'Under \$50',
    '\$50 - \$100',
    '\$100 - \$200',
    'Over \$200'
  ];

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

      filterCategoriesAndTags();
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
      skip += limit;
      hasMore = result.products.length == limit;

      filterCategoriesAndTags();

      applyAllFilters();
    } catch (e) {
      Get.snackbar("Error", "Failed to load more products");
    } finally {
      isMoreLoading(false);
    }
  }

  void filterCategoriesAndTags() {
    final uniqueCategories =
        allProducts.map((p) => p.category).toSet().toList();
    categories.assignAll(['All', ...uniqueCategories]);

    final allTags = <String>[];
    for (var product in allProducts) {
      if (product.tags.isNotEmpty) {
        allTags.addAll(product.tags);
      }
    }
    tags.assignAll(['All', ...allTags.toSet().toList()]);
  }

  void searchQuery(String query) {
    filterText.value = query;
    applyAllFilters();
  }

  void setCategory(String category) {
    selectedCategory.value = category;
    applyAllFilters();
  }

  void setTag(String tag) {
    selectedTag.value = tag;
    applyAllFilters();
  }

  void setPriceRange(String priceRange) {
    selectedPriceRange.value = priceRange;
    applyAllFilters();
  }

  void applyAllFilters() {
    List<Product> filteredList = allProducts;

    if (filterText.isNotEmpty) {
      filteredList = filteredList
          .where((product) =>
              product.title
                  .toLowerCase()
                  .contains(filterText.value.toLowerCase()) ||
              product.category
                  .toLowerCase()
                  .contains(filterText.value.toLowerCase()))
          .toList();
    }

    if (selectedCategory.isNotEmpty && selectedCategory.value != 'All') {
      filteredList = filteredList
          .where((product) => product.category == selectedCategory.value)
          .toList();
    }

    if (selectedTag.isNotEmpty && selectedTag.value != 'All') {
      filteredList = filteredList
          .where((product) =>
              product.tags != null && product.tags.contains(selectedTag.value))
          .toList();
    }

    if (selectedPriceRange.isNotEmpty && selectedPriceRange.value != 'All') {
      filteredList = filteredList.where((product) {
        double price = product.price;
        switch (selectedPriceRange.value) {
          case 'Under \$50':
            return price < 50;
          case '\$50 - \$100':
            return price >= 50 && price <= 100;
          case '\$100 - \$200':
            return price > 100 && price <= 200;
          case 'Over \$200':
            return price > 200;
          default:
            return true;
        }
      }).toList();
    }

    searchProducts.assignAll(filteredList);
  }

  void resetFilters() {
    filterText.value = '';
    selectedCategory.value = '';
    selectedTag.value = '';
    selectedPriceRange.value = '';
    searchProducts.assignAll(allProducts);
  }
}
