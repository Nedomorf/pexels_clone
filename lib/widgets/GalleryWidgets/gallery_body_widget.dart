import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/photo_bloc/photo_bloc.dart';
import '../card_widget.dart';

class GalleryBodyWidget extends StatelessWidget {
  const GalleryBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPhotosBloc, GetPhotosState>(
      builder: (context, state) {
        return Column(
          children: [
            Flexible(
              flex: 9,
              child: GridView.builder(
                  controller: GetPhotosBloc().scrollController,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.75,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  itemCount: state.photos.length,
                  itemBuilder: (context, index) =>
                      CardWidget(photo: state.photos[index])),
            ),
            state.isLoading
                ? const Flexible(
                    flex: 1,
                    child: Center(child: CircularProgressIndicator()))
                : const SizedBox.shrink()
          ],
        );
      },
    );
  }
}