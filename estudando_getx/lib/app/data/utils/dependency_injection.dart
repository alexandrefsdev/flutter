import 'package:dio/dio.dart';
import 'package:estudando_getx/app/data/providers/local/local_auth.dart';
import 'package:estudando_getx/app/data/providers/remote/authentication_api.dart';
import 'package:estudando_getx/app/data/providers/remote/movies_api.dart';
import 'package:estudando_getx/app/data/repositories/local/local_auth_repository.dart';
import 'package:estudando_getx/app/data/repositories/remote/authentication_repository.dart';
import 'package:estudando_getx/app/data/repositories/remote/movies_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    // Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(),
    //     fenix: true);

    // Get.lazyPut<Dio>(
    //     () => Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3')),
    //     fenix: true);
    // // providers
    // Get.lazyPut<AuthenticationApi>(() => AuthenticationApi(), fenix: true);
    // Get.lazyPut<LocalAuth>(() => LocalAuth(), fenix: true);

    // // repositories
    // Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository(),
    //     fenix: true);
    // Get.lazyPut<LocalAuthRepository>(() => LocalAuthRepository(), fenix: true);

    Get.put<FlutterSecureStorage>(FlutterSecureStorage());

    Get.put<Dio>(Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3')));
    // providers
    Get.put<AuthenticationApi>(AuthenticationApi());
    Get.put<LocalAuth>(LocalAuth());
    Get.put<MoviesAPI>(MoviesAPI());

    // repositories
    Get.put<AuthenticationRepository>(AuthenticationRepository());
    Get.put<LocalAuthRepository>(LocalAuthRepository());
    Get.put<MoviesRepository>(MoviesRepository());
  }
}
