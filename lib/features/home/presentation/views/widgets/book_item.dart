import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AspectRatio(
        aspectRatio: 0.66,
        child: ClipRRect(
          borderRadius: .circular(16),
          child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
