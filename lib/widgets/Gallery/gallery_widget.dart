import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels_clone/utlis/constants.dart';

import '../../blocs/photo_bloc/photo_bloc.dart';
import 'card_widget.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 84,
        title: Column(
          children: [
            BlocBuilder<GetPhotosBloc, GetPhotosState>(
              builder: (context, state) {
                final _bloc = context.watch<GetPhotosBloc>();

                return SearchAnchor(
                  viewHintText: 'Search',
                  builder: (context, controller) {
                    return SizedBox(
                      height: 44,
                      child: SearchBar(
                          controller: controller,
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                          backgroundColor: MaterialStateProperty.all(bgColor),
                          trailing: controller.value.text != ''
                              ? [
                                  IconButton(
                                      onPressed: () {
                                        _bloc.add(GetPhotosEvent(
                                            path: 'curated', resetState: true));
                                        controller.clear();
                                      },
                                      icon: const Icon(Icons.close))
                                ]
                              : null,
                          onChanged: (value) {
                            _bloc.add(GetPhotosEvent(
                                path: 'search',
                                queries: {'query': value},
                                resetState: true));
                          },
                          onSubmitted: (value) {
                            _bloc.add(GetPhotosEvent(
                                path: 'search',
                                queries: {'query': value},
                                resetState: true));
                          }),
                    );
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {},
                      );
                    });
                  },
                );
              },
            ),
            const Divider()
          ],
        ),
      ),
      body: BlocBuilder<GetPhotosBloc, GetPhotosState>(
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
      ),
    );
  }
}

// List<Widget> photos = const <Widget>[
//   CardWidget(
//     url:
//         'https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=',
//     photographer: 'Daniil Pasko',
//     alt: 'Sunshine',
//   ),
//   CardWidget(
//     url:
//         'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8fDA%3D',
//     photographer: 'John Doe',
//     alt: 'Forest',
//   ),
//   CardWidget(
//     url:
//         'https://www.fotor.com/blog/wp-content/uploads/2017/09/photo-composition-e1597393995467-797x1024.jpg',
//     photographer: 'Jane Doe',
//     alt: 'Girl',
//   ),
//   CardWidget(
//     url:
//         'https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_1280.jpg',
//     photographer: 'Jack Johnes',
//     alt: 'Grass',
//   ),
//   CardWidget(
//     url:
//         'https://images-photo.com/img/images-photo-occasion-seconde-main-photographer-lifestyle-landscape-objectifs-appareil-hybrides.jpg',
//     photographer: 'Karl Robs',
//     alt: 'Mountains',
//   ),
//   CardWidget(
//     url:
//         'https://help.apple.com/assets/63FE2E4128940B15D83EBD8C/63FE2E4228940B15D83EBD93/en_US/4ec42252d66505e299133850cccd4949.png',
//     photographer: 'Apple Inc. with model Sane May',
//     alt: 'iPhone 15 Pro Max beautiful photo of sea and bla-bla-bla',
//   ),
//   CardWidget(
//     url:
//         'https://media.istockphoto.com/id/1181011006/photo/photo-of-amazing-dark-skin-lady-holding-photo-digicam-in-hands-photographing-foreign.jpg?s=612x612&w=0&k=20&c=SZ67CStYYU-mePnneWckz4WeeRB28v9fAuUzMHs_Bp0=',
//     photographer: 'Sane May',
//     alt: 'Hight quality',
//   )
// ];
