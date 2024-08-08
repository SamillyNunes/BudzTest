import '../models/models.dart';

abstract class HomeInfoRepository {
  Future<PetModel> fetchPet();
  Future<List<BannerModel>> fetchBanners();
}
