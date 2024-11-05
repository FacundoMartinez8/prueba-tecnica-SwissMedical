import '../../../../core/services/http_service.dart';
import '../../../../core/use_case/no_params.dart';
import '../../../../main.dart';
import '../../domain/entity/movie.dart';
import '../models/movie_model.dart';

abstract class HomePageRemoteDataSourceBase {
  Future<List<Movie>> getMoviesPopular(NoParams noParams);

  Future<List<Movie>> getMoviesTopRated(NoParams noParams);

  Future<List<Movie>> getMoviesTopUpcoming(NoParams noParams);
}

//@Injectable(as: HomePageRemoteDataSourceBase)
class HomePageRemoteDataSource implements HomePageRemoteDataSourceBase {
  final HttpServiceBase http;

  HomePageRemoteDataSource({required this.http});

  @override
  Future<List<Movie>> getMoviesPopular(NoParams noParams) async {
    final url = '$tmbdUrl/movie/popular?language=en-US&page=1';

    Map<String, String> headers = {
      "accept": "application/json",
      "Authorization": "Bearer $apiKey",
    };
    final result = await http.get(
      url: url,
      headers: headers,
    );

    return result['results'].map<Movie>((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Future<List<Movie>> getMoviesTopRated(NoParams noParams) async {
    final url = '$tmbdUrl/movie/top_rated?language=en-US&page=1';

    Map<String, String> headers = {
      "accept": "application/json",
      "Authorization": "Bearer $apiKey",
    };
    final result = await http.get(
      url: url,
      headers: headers,
    );

    return result['results'].map<Movie>((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Future<List<Movie>> getMoviesTopUpcoming(NoParams noParams) async {
    final url = '$tmbdUrl/movie/upcoming?language=en-US&page=1';

    Map<String, String> headers = {
      "accept": "application/json",
      "Authorization": "Bearer $apiKey",
    };
    final result = await http.get(
      url: url,
      headers: headers,
    );

    return result['results'].map<Movie>((e) => MovieModel.fromJson(e)).toList();
  }
}
