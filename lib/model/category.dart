class Category {
  int id;
  String name;
  String iconUrl;

  Category({
    required this.id,
    required this.name,
    required this.iconUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['categoryId'],
      name: json['name'],
      iconUrl: json['iconUrl'],
    );
  }

  Map<String, dynamic> toJson(Category category) {
    return {
      'categoryId': category.id,
      'name': category.name,
      'iconUrl': category.iconUrl
    };
  }
}
