import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/word.dart';

Future<List<Word>> loadWordsFromJson(String filename) async {
  final String jsonString = await rootBundle.loadString('assets/data/$filename');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => Word.fromJson(json)).toList();
}
