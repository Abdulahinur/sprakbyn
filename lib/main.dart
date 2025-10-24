import 'package:flutter/material.dart';

import 'models/category.dart';
import 'screens/categories_screen.dart';
import 'screens/home_screen.dart';
import 'screens/job_detail_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/saved_screen.dart';

void main() {
  runApp(const SprakbynApp());
}

class SprakbynApp extends StatelessWidget {
  const SprakbynApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF0B62A0));

    return MaterialApp(
      title: 'Språkbyn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: baseColorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
        textTheme: ThemeData.light().textTheme.copyWith(
              displaySmall: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700),
              headlineMedium: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700),
              headlineSmall: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700),
              titleLarge: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w600),
              titleMedium: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w600),
              bodyLarge: const TextStyle(fontFamily: 'Roboto', fontSize: 16),
              bodyMedium: const TextStyle(fontFamily: 'Roboto', fontSize: 15),
              bodySmall: const TextStyle(fontFamily: 'Roboto', fontSize: 13),
            ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF10375C),
          elevation: 0,
          titleTextStyle: ThemeData.light().textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF10375C),
              ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: baseColorScheme.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: baseColorScheme.primary,
            side: BorderSide(color: baseColorScheme.primary),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: baseColorScheme.primary,
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.antiAlias,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/categories': (context) => const CategoriesScreen(),
        '/saved': (context) => const SavedScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/job_detail': (context) {
          final category = ModalRoute.of(context)!.settings.arguments as Category;
          return JobDetailScreen(category: category);
        },
      },
    );
  }
}
