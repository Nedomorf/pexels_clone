import 'package:flutter/material.dart';

import '../widgets/FavouriteWidgets/favourite_body_widget.dart';
import 'screen_wrapper.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenWrapper(
        title: 'Favourites', body: FavouriteBodyWidget());
  }
}
