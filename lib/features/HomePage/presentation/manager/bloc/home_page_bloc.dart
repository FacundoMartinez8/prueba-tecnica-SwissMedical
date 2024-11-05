import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_swiss_medical/core/failure/failure.dart';
import 'package:prueba_tecnica_swiss_medical/core/use_case/no_params.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/entity/movie.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/use_case/get_movies_popular_use_case.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/use_case/get_movies_upcoming_use_case.dart';

import '../../../domain/use_case/get_movies_top_rated.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetMoviesPopularUseCase getMoviesPopularUseCase;
  final GetMoviesUpcomingUseCase getMoviesUpcomingUseCase;
  final GetMoviesTopRatedUseCase getMoviesTopRatedUseCase;

  HomePageBloc({
    required this.getMoviesPopularUseCase,
    required this.getMoviesUpcomingUseCase,
    required this.getMoviesTopRatedUseCase,
  }) : super(HomePageInitial()) {
    on<GetPopularMovieEvent>(_getMoviesPopular);
    on<GetMoviesTopRatedEvent>(_getMoviesTopRated);
    on<GetMoviesUpcomingEvent>(_getMoviesUpcoming);
  }

  void _getMoviesPopular(
    GetPopularMovieEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(OnLoading());
    final result = await getMoviesPopularUseCase(NoParams());
    result.fold(
      (l) => emit(OnMoviesPopularFailure(failure: l)),
      (r) => emit(OnMoviesPopular(moviesPopular: r)),
    );
  }

  void _getMoviesTopRated(
    GetMoviesTopRatedEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(OnLoading());
    final result = await getMoviesTopRatedUseCase(NoParams());
    result.fold(
      (l) => emit(OnMoviesTopRatedFailure(failure: l)),
      (r) => emit(OnMoviesTopRated(moviesTopRated: r)),
    );
  }

  void _getMoviesUpcoming(
    GetMoviesUpcomingEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(OnLoading());
    final result = await getMoviesUpcomingUseCase(NoParams());
    result.fold(
      (l) => emit(OnMoviesUpcomingFailure(failure: l)),
      (r) => emit(OnMoviesUpcoming(moviesUpcoming: r)),
    );
  }
}
