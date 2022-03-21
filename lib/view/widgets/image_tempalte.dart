import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageTemplate extends StatelessWidget {
  final String imageUrl;
  final double heigth;
  ImageTemplate(this.imageUrl, {this.heigth = 160});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}
