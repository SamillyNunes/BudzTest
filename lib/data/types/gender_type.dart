enum GenderType { male, female }

extension GenderExtension on GenderType {
  static GenderType fromString(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return GenderType.male;
      case 'female':
        return GenderType.female;
      default:
        return GenderType.male;
    }
  }
}
