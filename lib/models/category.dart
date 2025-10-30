class Category {
  final String id;
  final String title;
  final String subtitle;   // keep for future
  final String image;
  final String description; // NEW

  Category({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as String,
        title: json['title'] as String,
        subtitle: (json['subtitle'] ?? '') as String,
        image: json['image'] as String,
        description: (json['description'] ?? '') as String, // reads your JSON field
      );
}
