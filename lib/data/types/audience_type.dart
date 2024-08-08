enum AudienceType { all, premium }

extension AudienceTypeExtension on AudienceType {
  static AudienceType fromString(String label) {
    switch (label.toLowerCase()) {
      case 'premium':
        return AudienceType.premium;
      default:
        return AudienceType.all;
    }
  }
}
