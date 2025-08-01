import 'package:flutter/material.dart';
import 'category_detail_screen.dart';

class TransportScreen extends StatelessWidget {
  const TransportScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> wordList = const [
    {'swedish': 'Buss', 'translation': 'Bus'},
    {'swedish': 'Lastbil', 'translation': 'Truck'},
    {'swedish': 'Förare', 'translation': 'Driver'},
    {'swedish': 'Säkerhetsbälte', 'translation': 'Seatbelt'},
    {'swedish': 'Tidtabell', 'translation': 'Timetable'},
  ];

  @override
  Widget build(BuildContext context) {
    return CategoryDetailScreen(
      title: 'Transport',
      imagePath: 'assets/images/transport.jpg',
      words: wordList,
    );
  }
}
