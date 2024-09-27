import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: product.name, // Doit correspondre au tag de la liste
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    product.imageUrl,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 16),
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

