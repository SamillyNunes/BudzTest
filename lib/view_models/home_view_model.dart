import 'package:flutter/material.dart';

import '../data/models/models.dart';
import '../data/repositories/home_info_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeInfoRepository homeInfoRepository;
  HomeViewModel({required this.homeInfoRepository});

  bool isLoading = false;
  String? errorMessage;
  PetModel? pet;

  Future fetchData() async {
    isLoading = true;

    try {
      pet = await homeInfoRepository.fetchPet();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
