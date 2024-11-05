import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/no_params.dart';
import '../../../../core/utils/use_case_base.dart';
import '../entity/movie.dart';
import '../repository/home_page_repository_base.dart';

class GetMoviesTopRatedUseCase extends UseCaseBase<List<Movie>, NoParams> {
  final HomePageRepositoryBase homeRepository;

  GetMoviesTopRatedUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    return homeRepository.getMoviesTopRated(params);
  }
}
