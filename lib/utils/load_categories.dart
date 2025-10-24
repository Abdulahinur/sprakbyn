import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/category.dart';

Future<List<Category>> loadCategoriesFromJson() async {
  final raw = await rootBundle.loadString('assets/data/categories.json');
  final List<dynamic> list = json.decode(raw) as List<dynamic>;
  return list.map((e) => Category.fromJson(e as Map<String, dynamic>)).toList();
}
