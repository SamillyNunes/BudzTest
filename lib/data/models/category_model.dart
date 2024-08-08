class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;

  CategoryModel({required this.id, required this.name, required this.imageUrl});

  factory CategoryModel.fromJson(Map json) {
    return CategoryModel(
      id: json["id"],
      name: json["name"],
      imageUrl: json["imageUrlSquare"],
    );
  }
}
