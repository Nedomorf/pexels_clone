part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitState extends PhotoState {}

final class GetPhotosState extends PhotoState {
  final List<PhotoModel> photos;
  final bool isLoading;

  GetPhotosState({required this.photos, required this.isLoading});

  GetPhotosState copyWith({List<PhotoModel>? photos, bool? isLoading}) {
    return GetPhotosState(
        photos: [...this.photos, ...?photos], isLoading: isLoading ?? false);
  }
}
