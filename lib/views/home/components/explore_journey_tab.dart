import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';
import '../../components/tab_title.dart';
import 'categories_page_view.dart';

class ExploreJourneyTab extends StatelessWidget {
  final List<CategoryModel> categories;
  const ExploreJourneyTab({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        TabTitle(
          title: 'Explorar Jornadas',
          description: 'Descubra novas trilhas',
          onPressed: () {},
        ),
        SizedBox(height: size.height * .03),
        CategoriesPageView(categories: categories),
      ],
    );
  }
}
