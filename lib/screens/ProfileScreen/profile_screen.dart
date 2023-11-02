import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_bloc/user_bloc.dart';
import '../../widgets/text_icon_button_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Profile'.toUpperCase()),
      ),
      body: BlocBuilder<UserBloc, UserInittedState>(builder: (context, state) {
        final _bloc = context.watch<UserBloc>();
        _onLogOutPressed() => _bloc.add(DeleteUserEvent());

        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 44),
                    child: Text(state.username)),
                TextIconButtonWidget(
                  onPressed: _onLogOutPressed,
                  text: 'Sign Out',
                  icon: Icons.logout,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
