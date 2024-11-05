import 'dart:convert';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/data/models/movie_model.dart';
import 'package:prueba_tecnica_swiss_medical/features/HomePage/domain/entity/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesServicesBase {
  final SharedPreferences prefs;

  PreferencesServicesBase({required this.prefs});

  Future<void> saveMoviesList(List<Movie> movies, String key);

  Future<List<Movie>> getMoviesList(String key);
}

class PreferencesServices extends PreferencesServicesBase {
  PreferencesServices({required super.prefs});

  @override
  Future<void> saveMoviesList(List<Movie> movies, String key) async {
    final List<Map<String, dynamic>> moviesJsonList = movies.map((movie) => movie.toJson()).toList();
    final value = jsonEncode(moviesJsonList);
    await prefs.setString(key, value);
  }

  @override
  Future<List<Movie>> getMoviesList(String key) async {
    final value = prefs.getString(key);
    if (value == null || value.isEmpty) {
      return [];
    }
    final List<dynamic> moviesJsonList = jsonDecode(value);
    final List<Movie> movies = moviesJsonList.map((json) => MovieModel.fromJson(json)).toList();
    return movies;
  }
}
