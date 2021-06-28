import 'package:core_mobile/app/data/providers/projects_api.dart';
import 'package:core_mobile/app/data/repositories/projects_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    print('Injeção de dependência...');
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

    // Get.put<FlutterSecureStorage>(FlutterSecureStorage());

    Get.put<Dio>(Dio(BaseOptions(baseUrl: 'http://192.168.0.52:3000/api/v1/')));
    // // providers
    // Get.put<AuthenticationApi>(AuthenticationApi());
    // Get.put<LocalAuth>(LocalAuth());
    Get.put<ProjectsAPI>(ProjectsAPI());

    // // repositories
    // Get.put<AuthenticationRepository>(AuthenticationRepository());
    // Get.put<LocalAuthRepository>(LocalAuthRepository());
    Get.put<ProjectsRepository>(ProjectsRepository());
  }
}
