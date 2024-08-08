enum PetSpecieType {
  dog('Cachorro');

  final String description;

  const PetSpecieType(this.description);
}

extension PetSpecieExtension on PetSpecieType {
  static PetSpecieType fromString(String specie) {
    switch (specie.toLowerCase()) {
      case 'dog':
        return PetSpecieType.dog;
      default:
        return PetSpecieType.dog;
    }
  }
}
