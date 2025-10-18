import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List<dynamic>> loadCategories() async {
  final jsonStr = await rootBundle.loadString('assets/data/categories.json');
  return json.decode(jsonStr) as List<dynamic>;
}
