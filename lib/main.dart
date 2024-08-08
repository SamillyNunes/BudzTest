import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repositories/repositories.dart';
import 'data/services/api_service.dart';
import 'view_models/home_view_model.dart';
import 'views/home/home_view.dart';

void main() {
  final apiService = ApiService();

  final HomeInfoRepository homeInfoRepository =
      HomeInfoRepositoryImpl(apiService: apiService);

  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        homeInfoRepository: homeInfoRepository,
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
