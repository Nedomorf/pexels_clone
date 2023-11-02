import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user_bloc/user_bloc.dart';
import '../models/photo_model.dart';
import '../utlis/constants.dart';

class PhotoWidget extends StatelessWidget {
  final PhotoModel photo;
  final bool? closeOnUnlike;

  const PhotoWidget({super.key, required this.photo, this.closeOnUnlike});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: BlocBuilder<UserBloc, UserInittedState>(
            builder: (context, state) {
              final _bloc = context.watch<UserBloc>();

              final photos = [...state.photos];
              final isLiked = photos.contains(photo);

              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          color: textColor,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 128,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          photo.alt!.isNotEmpty ? (photo.alt ?? '') : 'unnamed',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (isLiked) {
                            photos.remove(photo);

                            if (closeOnUnlike != null && closeOnUnlike!) {
                              Navigator.pop(context);
                            }
                          } else {
                            photos.add(photo);
                          }

                          _bloc.add(UpdateUserEvent(photos: photos));
                        },
                        icon: Icon(
                          isLiked
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isLiked ? Colors.red : textColor,
                        ))
                  ]);
            },
          ),
        ),
        body: Center(
          child: CachedNetworkImage(
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl: photo.srcOriginal!,
          ),
        ));
    // body: CachedNetworkImage(imageUrl: url));
  }
}
