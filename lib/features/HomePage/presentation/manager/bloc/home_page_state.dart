part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

class OnLoading extends HomePageState {}

class OnMoviesPopularFailure extends HomePageState {
  final Failure failure;

  OnMoviesPopularFailure({required this.failure});
}

class OnMoviesPopular extends HomePageState {
  final List<Movie> moviesPopular;

  OnMoviesPopular({required this.moviesPopular});
}

class OnMoviesByNameFailure extends HomePageState {
  final Failure failure;

  OnMoviesByNameFailure({required this.failure});
}

class OnMoviesByName extends HomePageState {
  final List<Movie> moviesByName;

  OnMoviesByName({required this.moviesByName});
}

class OnMoviesFavorite extends HomePageState {
  OnMoviesFavorite();
}

class OnMoviesTopRatedFailure extends HomePageState {
  final Failure failure;

  OnMoviesTopRatedFailure({required this.failure});
}

class OnMoviesTopRated extends HomePageState {
  final List<Movie> moviesTopRated;

  OnMoviesTopRated({required this.moviesTopRated});
}

class OnMoviesUpcomingFailure extends HomePageState {
  final Failure failure;

  OnMoviesUpcomingFailure({required this.failure});
}

class OnMoviesUpcoming extends HomePageState {
  final List<Movie> moviesUpcoming;

  OnMoviesUpcoming({required this.moviesUpcoming});
}
