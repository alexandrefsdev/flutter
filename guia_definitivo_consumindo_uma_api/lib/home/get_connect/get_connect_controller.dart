import 'package:get/get.dart';
import 'package:guia_definitivo_consumindo_uma_api/repository/i_project_repository.dart';

class GetConnectController extends GetxController with StateMixin {
  final IProjectRepository _httpRepository;

  GetConnectController(this._httpRepository);

  @override
  void onInit() {
    super.onInit();
    findProjects();
  }

  Future<void> findProjects() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _httpRepository.findAllProjects();
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
