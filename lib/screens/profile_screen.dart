import 'package:flutter/material.dart';

import 'screen_wrapper.dart';
import '../widgets/ProfileWidgets/profile_body_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenWrapper(title: 'My Profile', body: ProfileBodyWidget());
  }
}
