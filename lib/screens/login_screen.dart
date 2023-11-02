import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user_bloc/user_bloc.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  void _inputChaged(String value) {
    setState(() {
      _username = value;
    });
  }

  late String _username;

  @override
  void initState() {
    _username = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserInittedState>(
      builder: (context, state) {
        final _bloc = context.watch<UserBloc>();

        return Material(
          elevation: 0.0,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Let’s Sign You In'),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'User Name'),
                  initialValue: state.username,
                  onChanged: _inputChaged,
                  onFieldSubmitted: (value) {
                    _bloc.add(UpdateUserEvent(username: value, loggedIn: true));
                  },
                ),
                const Center(child: Text('SignIn'))
              ],
            ),
          )),
        );
      },
    );
  }
}
