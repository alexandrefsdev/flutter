import 'package:estudando_getx/app/data/models/movie.dart';
import 'package:estudando_getx/app/data/providers/remote/movies_api.dart';
import 'package:get/get.dart';

class MoviesRepository {
  final MoviesAPI _moviesAPI = Get.find<MoviesAPI>();

  Future<List<Movie>?> getTopMovies() => _moviesAPI.getTopMovies();
}
