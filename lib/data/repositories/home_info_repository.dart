import '../models/models.dart';

abstract class HomeInfoRepository {
  Future<PetModel> fetchPet();
}
