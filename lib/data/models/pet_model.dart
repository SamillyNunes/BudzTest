import '../types/gender_type.dart';
import '../types/pet_specie_type.dart';

class PetModel {
  final String id;
  final String name;
  final PetSpecieType specie;
  final GenderType gender;
  final String breed;
  final String photoUrl;
  final bool mainPet;

  PetModel({
    required this.id,
    required this.name,
    required this.specie,
    required this.gender,
    required this.breed,
    required this.photoUrl,
    required this.mainPet,
  });

  factory PetModel.fromJson(Map json) {
    return PetModel(
      id: json["id"],
      name: json["name"],
      specie: PetSpecieExtension.fromString(json["specie"]),
      gender: GenderExtension.fromString(json["gender"]),
      breed: json["breed"],
      photoUrl: json["photoUrl"],
      mainPet: json["mainPet"],
    );
  }
}
