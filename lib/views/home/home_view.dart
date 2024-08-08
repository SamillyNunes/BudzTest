import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/home_view_model.dart';
import '../components/pet_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(
      context,
      listen: false,
    ).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.isLoading || viewModel.pet == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final pet = viewModel.pet!;

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
                PetHeader(pet: pet),
              ],
            ),
          );
        },
      ),
    );
  }
}
