class ArticleModel {
  final String id;
  final String title;
  final String colorCode;
  final String categoryName;
  final String imageUrl;

  ArticleModel(
      {required this.id,
      required this.title,
      required this.colorCode,
      required this.categoryName,
      required this.imageUrl});

  factory ArticleModel.fromJson(Map json) {
    return ArticleModel(
      id: json["id"],
      title: json["title"],
      colorCode: json["colorCode"],
      categoryName: json["categoryName"],
      imageUrl: json["imageUrlSquare"],
    );
  }
}
