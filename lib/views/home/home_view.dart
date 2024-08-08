import 'package:budz_app/views/home/components/explore_journey_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/home_view_model.dart';
import '../components/banners_pages.dart';
import '../components/info_card.dart';
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
                SizedBox(height: size.height * .03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                  child: Row(
                    children: [
                      InfoCard(
                        label: 'Sexo',
                        value: pet.gender.description,
                      ),
                      const SizedBox(width: 10),
                      const InfoCard(
                        label: 'Idade',
                        value: '1a3m',
                      ),
                      const SizedBox(width: 10),
                      const InfoCard(
                        label: 'Peso',
                        value: '--',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * .03),
                BannersPages(banners: viewModel.banners),
                SizedBox(height: size.height * .03),
                ExploreJourneyTab(categories: viewModel.categories),
              ],
            ),
          );
        },
      ),
    );
  }
}
