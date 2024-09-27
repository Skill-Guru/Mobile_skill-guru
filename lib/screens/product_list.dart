import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail.dart'; // Widget pour afficher la carte du produit

// Exemple de liste de produits
final List<Product> products = [
  Product(name: 'Miha', imageUrl: 'https://cal.com/api/avatar/47ac6682-dfbc-48e0-a2d5-90221e53e232.png', description: 'Pourquoi pas ?', price: 29.99),
  Product(name: 'Leo N', imageUrl: 'https://media.licdn.com/dms/image/v2/C4D03AQFaSsb2vcwZlQ/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1650898858092?e=2147483647&v=beta&t=6ECr-VoGz31mmBwgb2oR0sEWHBgiCRWXbc8pdWpH-CI', description: 'C’est mon jour de repos', price: 59.99),
  Product(name: 'Babaaaaass', imageUrl: 'https://media.licdn.com/dms/image/v2/C4E03AQFAInG4RB3BIw/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1601985174026?e=2147483647&v=beta&t=y_vQH7jsP6HN4N7OxJl3rhczG-v2P5OOhXADeDoFYCM', description: 'Énergie de survie', price: 19.99),
  Product(name: 'Guillaume', imageUrl: 'https://media.licdn.com/dms/image/v2/C4E03AQEME4QZCog0UQ/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1611841891404?e=2147483647&v=beta&t=Vx0RtSw-7onXmuTh-o37k8FQrbWQKx3Ik6AzLNG55p8', description: 'Café au lait et rêves', price: 49.99),
  Product(name: 'Lucass', imageUrl: 'https://media.licdn.com/dms/image/v2/D5603AQF-i0Ldox0a9w/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1699430144071?e=2147483647&v=beta&t=RwFzhXokmUgUhGdCFyd3z41wt15FtNKp8L45FG6DxD8', description: 'Le pire produit', price: 519.99),
  Product(name: 'Romain', imageUrl: 'https://media.licdn.com/dms/image/v2/D5603AQEZvidJMQzzAA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1724256447816?e=2147483647&v=beta&t=BlZAhBGKKiKCHFRX7bWRzQlJrHK6sXxE8zSA7QcKwOE', description: 'Soin des poils en colère', price: 519.98),
];

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste de Produits'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            elevation: 5,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Hero(
                  tag: product.name, // Tag unique pour l'animation
                  child: Image.network(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(product.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    product.description,
                    maxLines: 2, // Limit the description to 2 lines
                    overflow: TextOverflow.ellipsis, // Adds "..." if the text overflows
                  ),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


