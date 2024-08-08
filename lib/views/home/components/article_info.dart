import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../data/models/article_model.dart';
import '../../components/tag_text.dart';

class ArticleInfo extends StatelessWidget {
  final ArticleModel article;
  const ArticleInfo({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final color = article.colorCode.replaceAll('#', '');
    final colorCode = Color(int.parse('0xFF$color'));

    return Padding(
      padding: EdgeInsets.only(
        bottom: size.height * 0.03,
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      child: Row(
        children: [
          Container(
            width: size.width * 0.3,
            height: size.width * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TagText(
                    colorCode: colorCode,
                    label: article.categoryName,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.blueLight,
              ),
              child: const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: AppColors.blue,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
