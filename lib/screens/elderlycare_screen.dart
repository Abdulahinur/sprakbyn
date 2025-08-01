import 'package:flutter/material.dart';
import 'category_detail_screen.dart';

class ElderlyCareScreen extends StatelessWidget {
  const ElderlyCareScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> wordList = const [
    {'swedish': 'Vårdbiträde', 'translation': 'Care assistant'},
    {'swedish': 'Äldreboende', 'translation': 'Elderly home'},
    {'swedish': 'Matning', 'translation': 'Feeding'},
    {'swedish': 'Rullstol', 'translation': 'Wheelchair'},
    {'swedish': 'Trygghetslarm', 'translation': 'Emergency alarm'},
  ];

  @override
  Widget build(BuildContext context) {
    return CategoryDetailScreen(
      title: 'Sjukvård & Vårdbiträde',
      imagePath: 'assets/images/healthcare.jpg',
      words: wordList,
    );
  }
}
