import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<Map<String, String>> words;

  const CategoryDetailScreen({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.words,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: words.length,
              itemBuilder: (context, index) {
                final word = words[index];
                return ListTile(
                  title: Text(word['swedish']!),
                  subtitle: Text(word['translation']!),
                  trailing: Icon(Icons.star_border), // Add saving functionality later
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
