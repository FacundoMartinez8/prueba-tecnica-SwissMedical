import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_swiss_medical/core/services/dependencies_injection_service.dart';
import 'package:prueba_tecnica_swiss_medical/core/services/preferences_services.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/entity/movie.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/presentation/manager/bloc/home_page_bloc.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/presentation/pages/movie_details.dart';

class MovieCardWidget extends StatefulWidget {
  final Movie movie;
  const MovieCardWidget({super.key, required this.movie});

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  String urlImage = 'https://image.tmdb.org/t/p/w500';
  final local = getIt<PreferencesServicesBase>();
  final homePafeBloc = getIt<HomePageBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(MovieDetails.routeName, extra: widget.movie);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Hero(
                    tag: widget.movie.id,
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/placeholder.png'),
                      image: NetworkImage('$urlImage${widget.movie.posterPath}'),
                      fit: BoxFit.cover,
                      height: 142,
                      width: 180,
                      alignment: Alignment.center,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/placeholder.png',
                          fit: BoxFit.cover,
                          height: 142,
                          width: 180,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.movie.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            ratingStar(widget.movie.voteAverage),
          ],
        ),
      ),
    );
  }

  Widget ratingStar(double rating) {
    return RatingBar.builder(
      initialRating: rating / 2,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 17,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
