import 'package:flutter/material.dart';
import '../models/category.dart';
import '../utils/load_categories.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = loadCategoriesFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Språkbyn – Kategorier')),
      body: FutureBuilder<List<Category>>(
        future: futureCategories,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Fel: ${snap.error}'));
          }
          final items = snap.data ?? [];
          if (items.isEmpty) {
            return const Center(child: Text('Inga kategorier hittades.'));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.1,
            ),
            itemCount: items.length,
            itemBuilder: (_, i) {
              final c = items[i];
              return InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F7FA),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            c.image,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                              const Center(child: Icon(Icons.image_not_supported)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(c.title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                      if (c.subtitle.isNotEmpty)
                        Text(c.subtitle, style: const TextStyle(color: Color(0xFF667085), fontSize: 12)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
