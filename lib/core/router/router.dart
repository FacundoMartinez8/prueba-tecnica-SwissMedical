import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/HomePage/domain/entity/movie.dart';
import '../../features/HomePage/presentation/pages/home_page.dart';
import '../../features/HomePage/presentation/pages/movie_details.dart';

final goRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, state) => const HomePage(),
    ),
    GoRoute(
        path: '/movie_details',
        builder: (context, state) {
          final movie = state.extra as Movie;
          return MovieDetails(movie: movie);
        }),
  ],
);
