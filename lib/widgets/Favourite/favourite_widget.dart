import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels_clone/blocs/user_bloc/user_bloc.dart';
import 'package:pexels_clone/widgets/Gallery/card_widget.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Favourites'.toUpperCase()),
      ),
      body: BlocBuilder<UserBloc, UserInittedState>(builder: (context, state) {
        return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.75,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [...state.photos.map((photo) => CardWidget(photo: photo, closeOnUnlike: true))],
        );
      }),
    );
  }
}
