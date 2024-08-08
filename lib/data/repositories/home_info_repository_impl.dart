import 'package:budz_app/data/models/banner_model.dart';
import 'package:budz_app/data/models/category_model.dart';

import '../models/pet_model.dart';
import '../services/api_service.dart';
import 'home_info_repository.dart';

class HomeInfoRepositoryImpl implements HomeInfoRepository {
  final ApiService apiService;

  HomeInfoRepositoryImpl({required this.apiService});

  @override
  Future<PetModel> fetchPet() async {
    try {
      final pet = await apiService.fetchPet();
      return pet;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final banners = await apiService.fetchBanners();
      return banners;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final categories = await apiService.fetchCategories();
      return categories;
    } catch (e) {
      throw Exception(e);
    }
  }
}
