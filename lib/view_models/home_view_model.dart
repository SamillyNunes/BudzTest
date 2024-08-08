import 'package:flutter/material.dart';

import '../data/models/models.dart';
import '../data/repositories/home_info_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeInfoRepository homeInfoRepository;
  HomeViewModel({required this.homeInfoRepository});

  bool isLoading = false;
  String? errorMessage;
  PetModel? pet;
  List<BannerModel> banners = [];
  List<CategoryModel> categories = [];

  Future fetchData() async {
    isLoading = true;

    try {
      pet = await homeInfoRepository.fetchPet();
      banners = await homeInfoRepository.fetchBanners();
      categories = await homeInfoRepository.fetchCategories();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
