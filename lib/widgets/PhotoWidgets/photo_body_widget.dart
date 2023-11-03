import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/photo_model.dart';

class PhotoBodyWidget extends StatelessWidget {
  const PhotoBodyWidget({
    super.key,
    required this.photo,
  });

  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: photo.srcOriginal!,
      ),
    );
  }
}