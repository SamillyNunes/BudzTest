import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/models.dart';

const jsonFileDir = 'assets/json/budz_home.json';

class ApiService {
  ApiService() {
    loadJson();
  }

  dynamic jsonData;

  Future loadJson() async {
    try {
      final response = await rootBundle.loadString(jsonFileDir);

      jsonData = json.decode(response);
    } catch (e) {
      throw Exception('Something got wrong. Error stack message: $e');
    }
  }

  Future<PetModel> fetchPet() async {
    try {
      if (jsonData == null) {
        loadJson();
      }

      return PetModel.fromJson(jsonData["pet"]);
    } catch (e) {
      throw Exception('Error when trying to fecth pet: $e');
    }
  }
}
