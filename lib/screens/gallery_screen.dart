import 'package:flutter/material.dart';

import 'screen_wrapper.dart';
import '../widgets/GalleryWidgets/gallery_body_widget.dart';
import '../widgets/GalleryWidgets/gallery_title_widget.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenWrapper(
      title: GalleryTitleWidget(),
      body: GalleryBodyWidget(),
      toolbarHeight: 84,
    );
  }
}
