import 'package:flutter/material.dart';

import '../../data/models/banner_model.dart';
import 'banner_component.dart';
import 'index_indicator.dart';

class BannersPageView extends StatefulWidget {
  final List<BannerModel> banners;
  const BannersPageView({
    super.key,
    required this.banners,
  });

  @override
  State<BannersPageView> createState() => _BannersPageViewState();
}

class _BannersPageViewState extends State<BannersPageView> {
  final _controller = PageController(viewportFraction: 0.9);
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * .17,
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                activeIndex = value;
              });
            },
            itemCount: widget.banners.length,
            padEnds: false,
            itemBuilder: (context, index) => BannerComponent(
              banner: widget.banners[index],
              isLastBanner: widget.banners.length - 1 == index,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.banners.map((b) {
            final itemIndex = widget.banners.indexOf(b);
            final isCurrent = itemIndex == activeIndex;

            return IndexIndicator(
              isCurrent: isCurrent,
              isLast: itemIndex == widget.banners.length - 1,
            );
          }).toList(),
        ),
      ],
    );
  }
}
