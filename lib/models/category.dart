class Category {
  final String id;
  final String title;
  final String description;
  final String image;
  final String screen;

  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.screen,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      screen: json['screen'] ?? '',
    );
  }
}
