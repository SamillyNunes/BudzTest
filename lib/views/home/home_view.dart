import 'package:budz_app/core/app_colors.dart';
import 'package:budz_app/views/components/banner_component.dart';
import 'package:budz_app/views/components/tab_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/home_view_model.dart';
import '../components/banners_page_view.dart';
import '../components/info_card.dart';
import '../components/pet_header.dart';
import '../components/tag_text.dart';
import 'components/article_info.dart';
import 'components/explore_journey_tab.dart';

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
                BannersPageView(banners: viewModel.banners),
                SizedBox(height: size.height * .03),
                ExploreJourneyTab(categories: viewModel.categories),
                if (viewModel.singleBanner != null)
                  SizedBox(
                    height: size.height * 0.17,
                    child: BannerComponent(
                      banner: viewModel.singleBanner!,
                      isLastBanner: true,
                    ),
                  ),
                SizedBox(height: size.height * .05),
                TabTitle(
                  title: 'Artigos',
                  description: 'Conteúdos e dicas extras',
                  onPressed: () {},
                ),
                SizedBox(height: size.height * .03),
                ...viewModel.articles.map((article) {
                  return ArticleInfo(article: article);
                }),
                SizedBox(height: size.height * .05),
              ],
            ),
          );
        },
      ),
    );
  }
}
