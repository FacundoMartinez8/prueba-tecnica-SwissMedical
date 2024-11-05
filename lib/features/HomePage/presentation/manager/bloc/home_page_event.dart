part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class GetPopularMovieEvent extends HomePageEvent {
  final NoParams noParams;

  GetPopularMovieEvent({required this.noParams});
}

class GetMoviesTopRatedEvent extends HomePageEvent {
  final NoParams noParams;

  GetMoviesTopRatedEvent({required this.noParams});
}

class GetMoviesUpcomingEvent extends HomePageEvent {
  final NoParams noParams;

  GetMoviesUpcomingEvent({required this.noParams});
}
