import '../types/audience_type.dart';

class BannerModel {
  final String id;
  final AudienceType audience;
  final bool status;
  final String partner;
  final int priority;
  final String link;
  final String? targetSpecie;
  final String imageUrl;

  BannerModel({
    required this.id,
    required this.audience,
    required this.status,
    required this.partner,
    required this.priority,
    required this.link,
    required this.imageUrl,
    this.targetSpecie,
  });

  factory BannerModel.fromJson(Map json) {
    return BannerModel(
      id: json["id"],
      audience: AudienceTypeExtension.fromString(json["audience"]),
      status: json["status"],
      partner: json["partner"],
      priority: json["priority"],
      link: json["link"],
      imageUrl: json["imageURL"],
      targetSpecie: json["targetSpecie"],
    );
  }
}
