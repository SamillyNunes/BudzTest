import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/models.dart';

const jsonFileDir = 'assets/json/budz_home.json';

class ApiService {
  dynamic jsonData;

  Future loadJson() async {
    try {
      final response = await rootBundle.loadString(jsonFileDir);

      jsonData = json.decode(response);

      return jsonData;
    } catch (e) {
      throw Exception('Something got wrong. Error stack message: $e');
    }
  }

  Future<PetModel> fetchPet() async {
    try {
      jsonData ??= await loadJson();

      return PetModel.fromJson(jsonData["pet"]);
    } catch (e) {
      throw Exception('Error when trying to fecth pet: $e');
    }
  }

  Future<List<BannerModel>> fetchBanners() async {
    try {
      jsonData ??= await loadJson();

      final banners = jsonData["banners"] as List;

      return banners.map((banner) => BannerModel.fromJson(banner)).toList();
    } catch (e) {
      throw Exception('Error when trying to fecth banners: $e');
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      jsonData ??= await loadJson();

      final categories = jsonData["categories"] as List;

      return categories
          .map((category) => CategoryModel.fromJson(category))
          .toList();
    } catch (e) {
      throw Exception('Error when trying to fecth categories: $e');
    }
  }
}
