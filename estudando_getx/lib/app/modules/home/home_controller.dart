import 'package:estudando_getx/app/data/models/movie.dart';
import 'package:estudando_getx/app/data/repositories/local/local_auth_repository.dart';
import 'package:estudando_getx/app/data/repositories/remote/movies_repository.dart';
import 'package:estudando_getx/app/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  final MoviesRepository _moviesRepository = Get.find<MoviesRepository>();

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  Future<void> logOut() async {
    await _localAuthRepository.clearSession();
    Get.offNamedUntil(AppRoutes.LOGIN, (_) => false);
  }

  @override
  void onReady() {
    _load();
  }

  Future<void> _load() async {
    try {
      _movies = (await _moviesRepository.getTopMovies())!;
      print("movies:::: ${_movies.length}");
      update();
    } on Exception catch (e) {
      print(e);
    }
  }
}
