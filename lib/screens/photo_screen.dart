import 'package:flutter/material.dart';
import 'package:pexels_clone/screens/screen_wrapper.dart';

import '../models/photo_model.dart';
import '../widgets/PhotoWidgets/photo_body_widget.dart';
import '../widgets/PhotoWidgets/photo_title_widget.dart';

class PhotoScreen extends StatelessWidget {
  final PhotoModel photo;
  final bool? closeOnUnlike;

  const PhotoScreen({super.key, required this.photo, this.closeOnUnlike});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        title: PhotoTitleWidget(photo: photo, closeOnUnlike: closeOnUnlike),
        body: PhotoBodyWidget(photo: photo),
        automaticallyImplyLeading: false);
  }
}
