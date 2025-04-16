import 'package:flutter/material.dart';
import 'package:logiology_project/model/product_model.dart'; // Update with your actual model import

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image
            AspectRatio(
              aspectRatio: 1.5,
              child: Image.network(
                widget.product.thumbnail,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, size: 40),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Product Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.title,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("\$${widget.product.price.toStringAsFixed(2)}",
                      style:
                          const TextStyle(fontSize: 18, color: Colors.green)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(widget.product.rating.toString(),
                          style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("Description",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(widget.product.description,
                      style: const TextStyle(fontSize: 14)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
