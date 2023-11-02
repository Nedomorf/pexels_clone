import 'dart:convert';

import 'photo_model.dart';

class UserModel {
  final String? username;
  final bool? loggedIn;
  final List<PhotoModel>? photos;

  UserModel(
      {required this.username, required this.loggedIn, required this.photos});

  factory UserModel.fromJson(dynamic json) {
    final List<PhotoModel> formatedPhotos = json['photos'] != null
        ? (json['photos'] as List<String>?)?.map((photoString) {
              final decoded = jsonDecode(photoString);

              return PhotoModel.fromJson(decoded);
            }).toList() ??
            []
        : [];

    return UserModel(
        username: json['username'],
        loggedIn: json['loggedIn'],
        photos: formatedPhotos);
  }
}
