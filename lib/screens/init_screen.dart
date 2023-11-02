import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_monitor/shared_preferences_monitor.dart';

import '../blocs/photo_bloc/photo_bloc.dart';
import '../blocs/user_bloc/user_bloc.dart';
import '../utlis/theme.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class InitScreenWrapper extends StatelessWidget {
  const InitScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetPhotosBloc>(
          create: (context) => GetPhotosBloc()..add(GetInitPhotosEvent()),
          lazy: false,
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc()..add(InitUserEvent()),
          lazy: false,
        ),
      ],
      child: const InitScreen(),
    );
  }
}

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: basicTheme(),
      debugShowCheckedModeBanner: false,
      navigatorKey: SharedPreferencesMonitor.getKey(),
      home: BlocBuilder<UserBloc, UserInittedState>(
        buildWhen: (previous, current) => previous.loggedIn != current.loggedIn,
        builder: (context, state) {
          return state.loggedIn ? const MainScreen() : const LogInScreen();
        },
      ),
    );
  }
}
