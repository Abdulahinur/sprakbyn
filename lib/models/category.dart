class Category {
  final String id;
  final String title;
  final String subtitle;
  final String image; // asset path like assets/images/warehouse.jpg

  Category({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as String,
        title: json['title'] as String,
        subtitle: (json['subtitle'] ?? '') as String,
        image: json['image'] as String,
      );
}
