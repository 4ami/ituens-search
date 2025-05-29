library;

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:ui/feature/landing/data/model/models_lib.dart';
import 'package:ui/feature/landing/data/repo/search_repository.dart';

part 'event.dart';
part 'state.dart';

final class LandingBloc extends Bloc<LandingEvent, LandingState> {
  final SearchRepository _searchRepository = SearchRepository();

  LandingBloc() : super(const LandingState()) {
    _onSearch();
  }

  void _onSearch() {
    on<SearchTermChanged>(
      _onSearchTermChanged,
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  String getErrorMessage(dynamic error) {
    if (error is ClientException) return 'No internet connection';
    if (error is String) return error;
    if (error is Exception) return 'Something went wrong';
    return 'Something went wrong';
  }

  Future<void> _onSearchTermChanged(
    SearchTermChanged event,
    Emitter<LandingState> emit,
  ) async {
    emit(state.copyWith(event: LoadingEvent()));

    ITunesSearchResponse? then(ITunesSearchResponse res) {
      if (res.code != 200) throw 'Failed to fetch data';
      return res;
    }

    String errorMessage = '';

    ITunesSearchResponse? response = await _searchRepository
        .search(term: event.term)
        .then(then)
        .catchError((e) {
          errorMessage = getErrorMessage(e);
          return null;
        });

    if (errorMessage.isNotEmpty || response == null) {
      emit(
        state.copyWith(
          event: SearchErrorEvent(
            error: 'Search Failed',
            message: errorMessage,
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        event: SearchSuccessEvent(),
        results: response.results,
        podcasts:
            response.results.where((e) => e.kind.contains('podcast')).toList(),
        otherResults:
            response.results.where((e) => !e.kind.contains('podcast')).toList(),
      ),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (event, mapper) {
      return event
          .transform(_DebounceStreamTransformer(duration: duration))
          .asyncExpand(mapper);
    };
  }
}

class _DebounceStreamTransformer<T> implements StreamTransformerBase<T, T> {
  final Duration duration;

  _DebounceStreamTransformer({required this.duration});

  @override
  Stream<T> bind(Stream<T> stream) {
    late StreamController<T> controller;
    Timer? debounceTimer;

    void onData(T event) {
      debounceTimer?.cancel();
      debounceTimer = Timer(duration, () {
        if (!controller.isClosed) {
          controller.add(event);
        }
      });
    }

    void onDone() {
      debounceTimer?.cancel();
      controller.close();
    }

    void onError(Object error, StackTrace stackTrace) {
      debounceTimer?.cancel();
      controller.addError(error, stackTrace);
    }

    controller = StreamController<T>(
      onListen: () {
        stream.listen(
          onData,
          onError: onError,
          onDone: onDone,
          cancelOnError: false,
        );
      },
      onCancel: () {
        debounceTimer?.cancel();
      },
    );
    return controller.stream;
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() => StreamTransformer.castFrom(this);
}
