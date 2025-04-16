import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology_project/controller/getx/product_controller.dart';
import 'package:logiology_project/view/screens/product_details_screen.dart';
import 'package:logiology_project/view/widgets/filter_drop_down_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          "Products",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/profile');
            },
            icon: const Icon(Icons.person_outline, color: Colors.black),
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 12,
                              color: Colors.white,
                              margin: const EdgeInsets.only(bottom: 6),
                            ),
                            Container(
                              height: 10,
                              width: 50,
                              color: Colors.white,
                              margin: const EdgeInsets.only(bottom: 6),
                            ),
                            Container(
                              height: 10,
                              width: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
                onChanged: controller.searchQuery,
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Obx(() => FilterDropDownWidget(
                        hint: 'Category',
                        value: controller.selectedCategory.value.isEmpty
                            ? null
                            : controller.selectedCategory.value,
                        items: controller.categories,
                        onChanged: (val) => controller.setCategory(val ?? ''),
                      )),
                  const SizedBox(width: 10),

                  Obx(() => FilterDropDownWidget(
                        hint: 'Tag',
                        value: controller.selectedTag.value.isEmpty
                            ? null
                            : controller.selectedTag.value,
                        items: controller.tags,
                        onChanged: (val) => controller.setTag(val ?? ''),
                      )),
                  const SizedBox(width: 10),

                  Obx(() => FilterDropDownWidget(
                        hint: 'Price',
                        value: controller.selectedPriceRange.value.isEmpty
                            ? null
                            : controller.selectedPriceRange.value,
                        items: controller.priceRanges,
                        onChanged: (val) =>
                            controller.setPriceRange(val ?? ''),
                      )),

                  const SizedBox(width: 10),

                  TextButton.icon(
                    onPressed: controller.resetFilters,
                    icon: const Icon(Icons.filter_list_off, size: 18),
                    label: const Text('Reset'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red.shade100,
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: Obx(() {
                if (controller.searchProducts.isEmpty) {
                  return const Center(
                    child: Text("No products found matching your criteria"),
                  );
                }

                return GridView.builder(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.all(12),
                  itemCount: controller.searchProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final product = controller.searchProducts[index];
                    return InkWell(
                      onTap: () {
                        Get.to(ProductDetailsScreen(product: product));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16)),
                                child: Image.network(
                                  product.thumbnail,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.broken_image,
                                        size: 40),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "\$${product.price.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 13),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          size: 14, color: Colors.orange),
                                      const SizedBox(width: 4),
                                      Text(product.rating.toString(),
                                          style:
                                              const TextStyle(fontSize: 12)),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            Obx(() => controller.isMoreLoading.value
                ? const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox()),
          ],
        );
      }),
    );
  }
}


