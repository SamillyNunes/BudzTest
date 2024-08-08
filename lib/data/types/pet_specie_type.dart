enum PetSpecieType { dog }

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
