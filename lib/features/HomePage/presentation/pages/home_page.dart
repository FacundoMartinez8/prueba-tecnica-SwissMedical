import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_swiss_medical/core/services/dependencies_injection_service.dart';
import 'package:prueba_tecnica_swiss_medical/core/services/preferences_services.dart';
import 'package:prueba_tecnica_swiss_medical/core/use_case/no_params.dart';
import 'package:prueba_tecnica_swiss_medical/core/widgets/app_bar_widget.dart';
import 'package:prueba_tecnica_swiss_medical/core/widgets/navigator_bar_widget.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/entity/movie.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/presentation/manager/bloc/home_page_bloc.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/presentation/widgets/movies_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarHeight = 50.0;
  int currentIndex = 0;
  final homePageBloc = getIt<HomePageBloc>();
  List<Movie> moviesPopular = [];
  List<Movie> moviesTopRated = [];
  List<Movie> moviesUpcoming = [];
  final local = getIt<PreferencesServicesBase>();

  Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    return connectivityResult.any((a) => a == ConnectivityResult.mobile || a == ConnectivityResult.wifi);
  }

  void _checkConnectionAndFetchData() async {
    if (await isConnected()) {
      homePageBloc.add(GetPopularMovieEvent(noParams: NoParams()));
      homePageBloc.add(GetMoviesTopRatedEvent(noParams: NoParams()));
      homePageBloc.add(GetMoviesUpcomingEvent(noParams: NoParams()));
    } else {
      moviesPopular = await local.getMoviesList('moviesPopular');
      moviesTopRated = await local.getMoviesList('moviesTopRated');
      moviesUpcoming = await local.getMoviesList('moviesUpcoming');
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _checkConnectionAndFetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      bloc: homePageBloc,
      listener: (context, state) {
        if (state is OnMoviesPopularFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.message),
            ),
          );
        }
        if (state is OnMoviesTopRatedFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.message),
            ),
          );
        }
        if (state is OnMoviesUpcomingFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.message),
            ),
          );
        }
        if (state is OnMoviesUpcoming) {
          moviesUpcoming = state.moviesUpcoming;
        }
        if (state is OnMoviesTopRated) {
          moviesTopRated = state.moviesTopRated;
        }
        if (state is OnMoviesPopular) {
          moviesPopular = state.moviesPopular;
        }

        setState(() {});
      },
      builder: (context, state) {
        if (state is OnLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
            backgroundColor: Colors.black87,
            appBar: AppBarWidget(
              appBarHeight: appBarHeight,
              index: currentIndex,
            ),
            body: IndexedStack(
              index: currentIndex,
              children: [
                MoviesWidget(movies: moviesPopular),
                MoviesWidget(movies: moviesTopRated),
                MoviesWidget(movies: moviesUpcoming),
              ],
            ),
            bottomNavigationBar: BottomNavigationBarWidget(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ));
      },
    );
  }
}
