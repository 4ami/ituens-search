part of 'bloc.dart';

sealed class LandingEvent {
  const LandingEvent({this.message = ''});
  final String message;
}

class InitEvent extends LandingEvent {
  const InitEvent();
}

class SearchTermChanged extends LandingEvent {
  const SearchTermChanged({required this.term});
  final String term;
}

class LoadingEvent extends LandingEvent {
  const LoadingEvent();
}

class SearchSuccessEvent extends LandingEvent {
  const SearchSuccessEvent();
}

class SearchErrorEvent extends LandingEvent {
  const SearchErrorEvent({required this.error, required super.message});
  final String error;
}
