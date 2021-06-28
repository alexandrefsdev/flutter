// permite criar nossa regra de negócio e controlar nossos estados
// Regra: Todo controller deve possuir um, e apenas um, repository, sendo esse, um atributo requerido para inicializar seu controller no seu GetX widget.
// Caso você venha a precisar de dados de dois repositories diferentes em uma mesma page, você deve usar dois GetX widgets. Recomendamos que haja, no mínimo, um controller para cada page.
// Só existe uma exceção para que você possa usar o mesmo controllador para varias pages, e é bem simples:

import 'package:get/get.dart';
import 'package:getx_pattern_kauemurakami/data/repositories/posts_repository.dart';

class HomeController extends GetxController {
  //repository required
  final MyRepository repository;
  HomeController({required this.repository}) : assert(repository != null);

  //use o snippet getfinal para criar está variável
  final _postsList = [].obs;
  get postList => this._postsList.value;
  set postList(value) => this._postsList.value = value;

  ///função para recuperar todos os posts
  getAll() {
    repository.getAll().then((data) {
      this.postList = data;
    });
  }
}
