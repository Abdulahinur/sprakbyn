import 'package:flutter/material.dart';
import 'category_detail_screen.dart';

class ConstructionScreen extends StatelessWidget {
  const ConstructionScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> wordList = const [
    {'swedish': 'Hammare', 'translation': 'Hammer'},
    {'swedish': 'Skruvmejsel', 'translation': 'Screwdriver'},
    {'swedish': 'Byggnadsställning', 'translation': 'Scaffolding'},
    {'swedish': 'Skyddshjälm', 'translation': 'Safety helmet'},
    {'swedish': 'Arbetskläder', 'translation': 'Work clothes'},
  ];

  @override
  Widget build(BuildContext context) {
    return CategoryDetailScreen(
      title: 'Bygg & Konstruktion',
      imagePath: 'assets/images/bygg.jpg',
      words: wordList,
    );
  }
}
