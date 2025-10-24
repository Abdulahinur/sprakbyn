import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/category.dart';

Future<List<Category>> loadCategoriesFromJson() async {
  final jsonStr = await rootBundle.loadString('assets/data/categories.json');
  final List<dynamic> jsonList = json.decode(jsonStr) as List<dynamic>;
  return jsonList
      .map((rawCategory) => Category.fromJson(rawCategory as Map<String, dynamic>))
      .toList();
}
