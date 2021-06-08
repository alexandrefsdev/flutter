import 'package:get/get.dart';
import 'package:guia_definitivo_consumindo_uma_api/home/dio/repository/project_repository_dio.dart';
import 'package:guia_definitivo_consumindo_uma_api/repository/i_project_repository.dart';

class DioController extends GetxController with StateMixin {
  final IProjectRepository _dioRepository;

  DioController(this._dioRepository);

  @override
  void onInit() {
    super.onInit();
    findProjects();
  }

  Future<void> findProjects() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _dioRepository.findAllProjects();
      change(dados, status: RxStatus.success());
    } on Exception catch (e) {
      print(e);
      change(
        [],
        status: RxStatus.error('Erro ao buscar Projetos'),
      );
    }
  }
}
