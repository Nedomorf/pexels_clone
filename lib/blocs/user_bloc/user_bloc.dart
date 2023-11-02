import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../main.dart';
import '../../models/photo_model.dart';
import '../../models/user_model.dart';
import '../../utlis/constants.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserInittedState> {
  UserBloc()
      : super(UserInittedState(
            username: 'username', loggedIn: false, photos: const [])) {
    on<InitUserEvent>((event, emit) {
      final user = _onUserInitEvent();

      emit(state.copyWith(user.username, user.loggedIn, user.photos));
    });

    on<UpdateUserEvent>((event, emit) {
      _onUserUpdateEvent(event.username, event.loggedIn, event.photos);

      emit(state.copyWith(event.username, event.loggedIn, event.photos));
    });

    on<DeleteUserEvent>((event, emit) {
      _onDeleteUserEvent();

      emit(UserInittedState(
          username: 'username', loggedIn: false, photos: const []));
    });
  }
}

UserModel _onUserInitEvent() {
  final loggedIn = storageService.getStorageBool(loggedInStorageKey);
  final username = storageService.getStorageString(usernameStorageKey);
  final photos = storageService.getStorageList(photosStorageKey);

  return UserModel.fromJson(
      {'username': username, 'loggedIn': loggedIn, 'photos': photos});
}

void _onUserUpdateEvent(
    String? username, bool? loggedIn, List<PhotoModel>? photos) {
  storageService.updateStorage([
    (usernameStorageKey, username),
    (loggedInStorageKey, loggedIn),
    (
      photosStorageKey,
      photos?.map((photo) => jsonEncode(PhotoModel.toJson(photo))).toList()
    )
  ]);
}

void _onDeleteUserEvent() {
  storageService.removeStorage();
}
