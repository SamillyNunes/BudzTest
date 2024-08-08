import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';

class CategoriesPageView extends StatefulWidget {
  final List<CategoryModel> categories;
  const CategoriesPageView({super.key, required this.categories});

  @override
  State<CategoriesPageView> createState() => _CategoriesPageViewState();
}

class _CategoriesPageViewState extends State<CategoriesPageView> {
  final _controller = PageController(viewportFraction: 0.4);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .25,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.categories.length,
        padEnds: false,
        itemBuilder: (context, index) {
          final category = widget.categories[index];

          return Container(
            margin: EdgeInsets.only(
              left: size.width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.height * .17,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(category.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  category.name,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
