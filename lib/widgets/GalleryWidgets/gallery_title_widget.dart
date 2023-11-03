import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/photo_bloc/photo_bloc.dart';

class GalleryTitleWidget extends StatelessWidget {
  const GalleryTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}