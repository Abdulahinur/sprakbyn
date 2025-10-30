import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category category;
  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              category.image,
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 180,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EEF7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (category.description.isNotEmpty)
            Text(
              category.description,
              style: const TextStyle(fontSize: 16, color: Color(0xFF475467)),
            ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          const Text(
            'Ordliste-sektioner & quiz kommer härnäst.',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
