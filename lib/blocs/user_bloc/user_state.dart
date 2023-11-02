part of 'user_bloc.dart';

@immutable
sealed class UserState {}

class UserInittedState extends UserState {
  final String username;
  final bool loggedIn;
  final List<PhotoModel> photos;

  UserInittedState(
      {required this.username, required this.loggedIn, required this.photos});

  UserInittedState copyWith(
      String? username, bool? loggedIn, List<PhotoModel>? photos) {
    return UserInittedState(
        username: username ?? this.username,
        loggedIn: loggedIn ?? this.loggedIn,
        photos: photos ?? this.photos);
  }
}
