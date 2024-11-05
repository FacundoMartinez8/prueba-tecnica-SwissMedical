import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/presentation/widgets/movie_card_widget.dart';

import '../../../../core/services/dependencies_injection_service.dart';
import '../../../../core/services/preferences_services.dart';
import '../../domain/entity/movie.dart';
import '../manager/bloc/home_page_bloc.dart';

class MoviesWidget extends StatefulWidget {
  final List<Movie> movies;

  const MoviesWidget({super.key, required this.movies});

  @override
  State<MoviesWidget> createState() => _MoviesTopRatedState();
}

class _MoviesTopRatedState extends State<MoviesWidget> {
  final local = getIt<PreferencesServicesBase>();
  final homePageBloc = getIt<HomePageBloc>();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: (MediaQuery.of(context).size.width / 200).floor(),
        children: List.generate(widget.movies.length, (int index) {
          return FadeInDown(
            duration: const Duration(seconds: 1),
            delay: Duration(milliseconds: index * 100),
            child: MovieCardWidget(
              movie: widget.movies[index],
            ),
          );
        }));
  }
}
