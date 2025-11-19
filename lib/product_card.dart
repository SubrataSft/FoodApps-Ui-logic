import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const ProductCard({super.key, required this.product, required this.onTap, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 8, offset: const Offset(0,3))]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(product["img"], height: 90, width: double.infinity, fit: BoxFit.contain)),
              const SizedBox(height: 10),
              Text(product["name"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
              Text(product["sub"], style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [const Icon(Icons.star, color: Colors.orange, size: 18), const SizedBox(width: 4), Text(product["rating"].toString(), style: const TextStyle(fontWeight: FontWeight.bold))]),
                  IconButton(icon: Icon(product["isFavorite"] ? Icons.favorite : Icons.favorite_border, color: product["isFavorite"] ? Colors.red : Colors.black.withOpacity(0.7)), onPressed: onFavoriteToggle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}