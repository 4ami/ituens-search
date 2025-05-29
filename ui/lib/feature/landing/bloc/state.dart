part of 'bloc.dart';

class LandingState {
  const LandingState({
    this.event = const InitEvent(),
    this.results = const [],
    this.podcasts = const [],
    this.otherResults = const [],
  });

  final LandingEvent event;
  final List<ContentModel> results;
  final List<ContentModel> podcasts;
  final List<ContentModel> otherResults;

  LandingState copyWith({
    LandingEvent? event,
    List<ContentModel>? results,
    List<ContentModel>? podcasts,
    List<ContentModel>? otherResults,
  }) {
    return LandingState(
      event: event ?? this.event,
      results: results ?? this.results,
      podcasts: podcasts ?? this.podcasts,
      otherResults: otherResults ?? this.otherResults,
    );
  }
}
