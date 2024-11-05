import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_swiss_medical/core/failure/failure.dart';
import 'package:prueba_tecnica_swiss_medical/core/use_case/no_params.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/data/data_sources/home_page_remote_data_source.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/entity/movie.dart';

abstract class HomePageRepositoryBase {
  final HomePageRemoteDataSourceBase remote;

  HomePageRepositoryBase({required this.remote});

  Future<Either<Failure, List<Movie>>> getMoviesPopular(NoParams noParams);

  Future<Either<Failure, List<Movie>>> getMoviesTopRated(NoParams noParams);

  Future<Either<Failure, List<Movie>>> getMoviesUpcoming(NoParams noParams);
}
