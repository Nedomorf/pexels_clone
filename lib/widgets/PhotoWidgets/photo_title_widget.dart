import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_bloc/user_bloc.dart';
import '../../models/photo_model.dart';
import '../../utlis/constants.dart';

class PhotoTitleWidget extends StatelessWidget {
  const PhotoTitleWidget({
    super.key,
    required this.photo,
    required this.closeOnUnlike,
  });

  final PhotoModel photo;
  final bool? closeOnUnlike;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserInittedState>(
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
                    style: Theme.of(context).textTheme.titleLarge,
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
                    isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                    color: isLiked ? Colors.red : textColor,
                  ))
            ]);
      },
    );
  }
}
