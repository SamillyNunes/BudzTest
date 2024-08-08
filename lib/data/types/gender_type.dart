enum GenderType {
  male('Macho'),
  female('Fêmea');

  final String description;

  const GenderType(this.description);
}

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
