part of 'photo_bloc.dart';

@immutable
sealed class PhotoEvent {}

class GetInitPhotosEvent extends PhotoEvent {}

class GetPhotosEvent extends PhotoEvent {
  final String path;
  final Map<String, dynamic>? queries;
  final bool? resetState;

  GetPhotosEvent({required this.path, this.queries, this.resetState});
}
