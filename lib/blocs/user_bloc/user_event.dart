part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class InitUserEvent extends UserEvent {}

class UpdateUserEvent extends UserEvent {
  final String? username;
  final bool? loggedIn;
  final List<PhotoModel>? photos;

  UpdateUserEvent({this.username, this.loggedIn, this.photos});
}

class DeleteUserEvent extends UserEvent {}
