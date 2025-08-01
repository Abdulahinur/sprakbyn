import 'package:flutter/material.dart';
import 'category_detail_screen.dart';

class CleaningScreen extends StatelessWidget {
  const CleaningScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> wordList = const [
    {'swedish': 'Dammsugare', 'translation': 'Vacuum cleaner'},
    {'swedish': 'Mopp', 'translation': 'Mop'},
    {'swedish': 'Rengöringsmedel', 'translation': 'Cleaning agent'},
    {'swedish': 'Torka', 'translation': 'Wipe'},
    {'swedish': 'Papperskorg', 'translation': 'Trash bin'},
  ];

  @override
  Widget build(BuildContext context) {
    return CategoryDetailScreen(
      title: 'Städning',
      imagePath: 'assets/images/cleaning.jpg',
      words: wordList,
    );
  }
}
