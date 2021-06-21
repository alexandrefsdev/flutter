import 'package:dio/dio.dart';
import 'package:estudando_getx/app/data/providers/local/local_auth.dart';
import 'package:estudando_getx/app/data/providers/remote/authentication_api.dart';
import 'package:estudando_getx/app/data/repositories/local/local_auth_repository.dart';
import 'package:estudando_getx/app/data/repositories/remote/authentication_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage());
    Get.lazyPut<Dio>(
      () => Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3')),
    );
    // providers
    Get.lazyPut<AuthenticationApi>(() => AuthenticationApi());
    Get.lazyPut<LocalAuth>(() => LocalAuth());

    // repositories
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
    Get.lazyPut<LocalAuthRepository>(() => LocalAuthRepository());
  }
}
