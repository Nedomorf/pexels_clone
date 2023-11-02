import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../main.dart';
import '../../models/photo_model.dart';

part 'photo_event.dart';
part 'photo_state.dart';

final ScrollController _scrollController = ScrollController();

int page = 1;
bool hasNextPage = true;
bool isCurated = true;
String query = '';

EventTransformer<E> debouceDropable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class GetPhotosBloc extends Bloc<PhotoEvent, GetPhotosState> {
  ScrollController get scrollController => _scrollController;

  GetPhotosBloc() : super(GetPhotosState(photos: const [], isLoading: false)) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange &&
          hasNextPage) {
        add(GetPhotosEvent(
            path: isCurated ? 'curated' : 'search',
            queries: !isCurated ? {'query': query} : null));
      }
    });

    on<GetInitPhotosEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final (photos, currPage, hasNext) = await _onGetInitPhotosEvent();

      if (hasNext) page = currPage + 1;

      hasNextPage = hasNext;

      emit(state.copyWith(photos: photos));
    });

    on<GetPhotosEvent>((event, emit) async {
      query = event.queries?['query'] ?? '';

      if (event.resetState ?? false) {
        page = 1;
        isCurated = event.path == 'curated';
        emit(GetPhotosState(photos: const [], isLoading: true));
      } else {
        emit(state.copyWith(isLoading: true));
      }

      try {
        final (photos, currPage, hasNext) =
            await _onGetPhotosEvent(event.path, event.queries);

        if (hasNext) page = currPage + 1;

        hasNextPage = hasNext;

        emit(state.copyWith(photos: photos));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
      }
    }, transformer: debouceDropable(const Duration(milliseconds: 300)));
  }
}

Future<(List<PhotoModel>, int, bool)> _onGetInitPhotosEvent() async {
  final res = await httpService.get('curated', null);

  final List<dynamic> photos = res['photos'];
  final int currPage = res['page'];
  final bool hasNext = res['next_page'].isNotEmpty;

  return (
    photos.map((json) => PhotoModel.fromJson(json)).toList(),
    currPage,
    hasNext
  );
}

Future<(List<PhotoModel>, int, bool)> _onGetPhotosEvent(
    String path, Map<String, dynamic>? quesries) async {
  final res = await httpService.get(path, {...?quesries, 'page': page});

  final List<dynamic> photos = res['photos'];
  final int currPage = res['page'];
  final bool hasNext = res['next_page'].isNotEmpty;

  return (
    photos.map((json) => PhotoModel.fromJson(json)).toList(),
    currPage,
    hasNext
  );
}
