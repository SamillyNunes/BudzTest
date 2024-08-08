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
  BannerModel? singleBanner;
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  Future fetchData() async {
    isLoading = true;

    try {
      pet = await homeInfoRepository.fetchPet();

      banners = await homeInfoRepository.fetchBanners();
      banners.sort((a, b) => (a.priority ?? 9).compareTo((b.priority ?? 9)));

      categories = await homeInfoRepository.fetchCategories();

      singleBanner = await homeInfoRepository.fetchSingleBanner();

      articles = await homeInfoRepository.fetchArticles();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
