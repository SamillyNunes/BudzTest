import 'package:flutter/material.dart';

import '../../data/models/banner_model.dart';

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
          image: DecorationImage(
            image: NetworkImage(banner.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
