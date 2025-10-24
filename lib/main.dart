import 'package:flutter/material.dart';
import 'screens/home_simple.dart';

void main() => runApp(const SprakbynApp());

class SprakbynApp extends StatelessWidget {
  const SprakbynApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Språkbyn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1e3a8a)),
        useMaterial3: true,
      ),
      home: const HomeSimple(),
      // No routes that reference CategoriesScreen here.
    );
  }
}
