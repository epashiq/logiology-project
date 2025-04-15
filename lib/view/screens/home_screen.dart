// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:logiology_project/controller/getx/product_controller.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final ProductController controller = Get.put(ProductController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Products"),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Get.toNamed('/profile');
//               },
//               icon: const Icon(Icons.person_2_outlined))
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         return Column(
//           children: [
//             Expanded(
//               child: GridView.builder(
//                 controller: controller.scrollController,
//                 padding: const EdgeInsets.all(8),
//                 itemCount: controller.products.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemBuilder: (context, index) {
//                   final product = controller.products[index];
//                   return Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.vertical(
//                                 top: Radius.circular(12)),
//                             child: Image.network(
//                               product.thumbnail,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(product.title,
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold)),
//                               const SizedBox(height: 4),
//                               Text("\$${product.price.toStringAsFixed(2)}",
//                                   style: const TextStyle(color: Colors.green)),
//                               const SizedBox(height: 4),
//                               Row(
//                                 children: [
//                                   const Icon(Icons.star,
//                                       color: Colors.orange, size: 16),
//                                   const SizedBox(width: 4),
//                                   Text(product.rating.toString()),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Obx(() {
//               return controller.isMoreLoading.value
//                   ? const Padding(
//                       padding: EdgeInsets.all(12.0),
//                       child: CircularProgressIndicator(),
//                     )
//                   : const SizedBox();
//             }),
//           ],
//         );
//       }),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:logiology_project/controller/getx/product_controller.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final ProductController controller = Get.put(ProductController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Products"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.toNamed('/profile');
//             },
//             icon: const Icon(Icons.person_2_outlined),
//           )
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         return Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: const InputDecoration(
//                   labelText: "Search Products",
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (value) => controller.searchQuery(value),
//               ),
//             ),
//             Expanded(
//               child: Obx(() {
//                 return GridView.builder(
//                   controller: controller.scrollController,
//                   padding: const EdgeInsets.all(8),
//                   itemCount: controller.searchProducts.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                     childAspectRatio: 0.7,
//                   ),
//                   itemBuilder: (context, index) {
//                     final product = controller.searchProducts[index];
//                     return Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: ClipRRect(
//                               borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(12)),
//                               child: Image.network(
//                                 product.thumbnail,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(product.title,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold)),
//                                 const SizedBox(height: 4),
//                                 Text("\$${product.price.toStringAsFixed(2)}",
//                                     style: const TextStyle(color: Colors.green)),
//                                 const SizedBox(height: 4),
//                                 Row(
//                                   children: [
//                                     const Icon(Icons.star,
//                                         color: Colors.orange, size: 16),
//                                     const SizedBox(width: 4),
//                                     Text(product.rating.toString()),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),
//             Obx(() {
//               return controller.isMoreLoading.value
//                   ? const Padding(
//                       padding: EdgeInsets.all(12.0),
//                       child: CircularProgressIndicator(),
//                     )
//                   : const SizedBox();
//             }),
//           ],
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology_project/controller/getx/product_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/profile');
            },
            icon: const Icon(Icons.person_2_outlined),
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "Search Products",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => controller.searchQuery(value),
              ),
            ),

            // Filter Dropdowns
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Category Filter
                  DropdownButton<String>(
                    value: controller.selectedCategory.value.isEmpty
                        ? null
                        : controller.selectedCategory.value,
                    hint: const Text('Category'),
                    items: ['Electronics', 'Clothing', 'Home', 'Sports']
                        .map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedCategory.value = value ?? '';
                      controller.applyFilters(); // Apply filter when changed
                    },
                  ),

                  // Tag Filter
                  DropdownButton<String>(
                    value: controller.selectedTag.value.isEmpty
                        ? null
                        : controller.selectedTag.value,
                    hint: const Text('Tag'),
                    items: ['New', 'Sale', 'Featured'].map((tag) {
                      return DropdownMenuItem<String>(
                        value: tag,
                        child: Text(tag),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedTag.value = value ?? '';
                      controller.applyFilters(); // Apply filter when changed
                    },
                  ),

                  // Price Range Filter
                  DropdownButton<String>(
                    value: controller.selectedPriceRange.value.isEmpty
                        ? null
                        : controller.selectedPriceRange.value,
                    hint: const Text('Price Range'),
                    items: ['Under \$50', '\$50 - \$100', 'Above \$100']
                        .map((priceRange) {
                      return DropdownMenuItem<String>(
                        value: priceRange,
                        child: Text(priceRange),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedPriceRange.value = value ?? '';
                      controller.applyFilters(); // Apply filter when changed
                    },
                  ),
                ],
              ),
            ),

            // Product List Grid
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.searchProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final product = controller.searchProducts[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.network(
                                product.thumbnail,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text("\$${product.price.toStringAsFixed(2)}",
                                    style:
                                        const TextStyle(color: Colors.green)),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.orange, size: 16),
                                    const SizedBox(width: 4),
                                    Text(product.rating.toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),

            // Load More Indicator
            Obx(() {
              return controller.isMoreLoading.value
                  ? const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox();
            }),
          ],
        );
      }),
    );
  }
}
