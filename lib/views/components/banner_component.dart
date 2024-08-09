import 'package:flutter/material.dart';

import '../../core/app_images.dart';
import '../../data/models/banner_model.dart';
import 'fade_image.dart';

class BannerComponent extends StatelessWidget {
  final BannerModel banner;
  final bool isLastBanner;

  const BannerComponent({
    super.key,
    required this.banner,
    this.isLastBanner = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        right: isLastBanner ? size.width * 0.05 : 0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: FadeImage(
          networkImageUrl: banner.imageUrl,
          placeholderImagePath: AppImages.placeholderImage,
          borderRadius: 20,
        ),
      ),
    );
  }
}
