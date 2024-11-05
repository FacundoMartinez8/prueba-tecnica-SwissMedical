import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:prueba_tecnica_swiss_medical/core/services/http_service.dart';
import 'package:prueba_tecnica_swiss_medical/core/services/preferences_services.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/data/data_sources/home_page_remote_data_source.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/data/repository/home_page_repository.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/repository/home_page_repository_base.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/use_case/get_movies_popular_use_case.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/use_case/get_movies_top_rated.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/use_case/get_movies_upcoming_use_case.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/presentation/manager/bloc/home_page_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //SERVICES
  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  getIt.registerSingleton<Client>(Client());
  getIt.registerSingleton<HttpServiceBase>(HttpService(http: getIt()));
  getIt.registerSingleton<PreferencesServicesBase>(PreferencesServices(prefs: getIt()));

  //DATA SOURCES
  getIt.registerSingleton<HomePageRemoteDataSourceBase>(HomePageRemoteDataSource(http: getIt()));

  //REPOSITORIES
  getIt.registerSingleton<HomePageRepositoryBase>(HomePageRepository(remote: getIt()));

  //USE CASES
  getIt.registerSingleton<GetMoviesPopularUseCase>(GetMoviesPopularUseCase(homeRepository: getIt()));
  getIt.registerSingleton<GetMoviesTopRatedUseCase>(GetMoviesTopRatedUseCase(homeRepository: getIt()));
  getIt.registerSingleton<GetMoviesUpcomingUseCase>(GetMoviesUpcomingUseCase(homeRepository: getIt()));
  //BLOCS
  getIt.registerSingleton<HomePageBloc>(HomePageBloc(
      getMoviesPopularUseCase: getIt(), getMoviesTopRatedUseCase: getIt(), getMoviesUpcomingUseCase: getIt()));
}
