import 'package:dio/dio.dart';
import 'package:estudando_getx/app/data/models/movie.dart';
import 'package:estudando_getx/app/data/utils/constants.dart';
import 'package:get/get.dart';

class MoviesAPI {
  final Dio _dio = Get.find<Dio>();

  Future<List<Movie>?> getTopMovies() async {
    final response = await _dio.get(
      '/movie/top_rated',
      queryParameters: {
        "api_key": Constants.THE_MOVIE_DB_API_KEY,
        "language": "pt-BR"
      },
    );

    return (response.data['results'] as List)
        .map((e) => Movie.fromJson(e))
        .toList();
  }
}
