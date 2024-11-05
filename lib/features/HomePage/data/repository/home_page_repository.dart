import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_swiss_medical/core/failure/failure.dart';
import 'package:prueba_tecnica_swiss_medical/core/services/dependencies_injection_service.dart';
import 'package:prueba_tecnica_swiss_medical/core/services/preferences_services.dart';
import 'package:prueba_tecnica_swiss_medical/core/use_case/no_params.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/entity/movie.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/repository/home_page_repository_base.dart';

class HomePageRepository extends HomePageRepositoryBase {
  final local = getIt<PreferencesServicesBase>();
  HomePageRepository({required super.remote});

  @override
  Future<Either<Failure, List<Movie>>> getMoviesPopular(NoParams noParams) async {
    try {
      final response = await remote.getMoviesPopular(noParams);
      local.saveMoviesList(response, 'moviesPopular');
      return Right(response);
    } catch (e) {
      return Left(
        UnhandledFailure(message: '$e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesTopRated(NoParams noParams) async {
    try {
      final response = await remote.getMoviesTopRated(noParams);
      local.saveMoviesList(response, 'moviesTopRated');
      return Right(response);
    } catch (e) {
      return Left(
        UnhandledFailure(message: '$e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesUpcoming(NoParams noParams) async {
    try {
      final response = await remote.getMoviesTopUpcoming(noParams);
      local.saveMoviesList(response, 'moviesUpcoming');
      return Right(response);
    } catch (e) {
      return Left(
        UnhandledFailure(message: '$e'),
      );
    }
  }
}
