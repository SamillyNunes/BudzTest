import 'package:flutter/material.dart';

class FadeImage extends StatelessWidget {
  final String networkImageUrl;
  final String placeholderImagePath;
  final double? borderRadius;

  const FadeImage({
    super.key,
    required this.networkImageUrl,
    required this.placeholderImagePath,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: FadeInImage(
        placeholder: AssetImage(placeholderImagePath),
        placeholderFit: BoxFit.cover,
        image: NetworkImage(networkImageUrl),
        fit: BoxFit.cover,
      ),
    );
  }
}
