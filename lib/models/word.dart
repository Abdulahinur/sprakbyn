class Word {
  final String word;
  final Map<String, String> translations;
  final String audio;

  Word({
    required this.word,
    required this.translations,
    required this.audio,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      translations: Map<String, String>.from(json['translations']),
      audio: json['audio'],
    );
  }
}
