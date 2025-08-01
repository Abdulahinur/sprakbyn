import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/category.dart';

Future<List<Category>> loadCategories() async {
  final String jsonString = await rootBundle.loadString('assets/data/categories.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => Category.fromJson(json)).toList();
}
