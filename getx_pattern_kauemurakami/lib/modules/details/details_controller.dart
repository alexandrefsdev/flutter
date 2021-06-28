import 'package:get/get.dart';
import 'package:getx_pattern_kauemurakami/data/models/my_model.dart';
import 'package:getx_pattern_kauemurakami/data/repositories/posts_repository.dart';

class DetailsController extends GetxController {
  final MyRepository repository;
  DetailsController({required this.repository}) : assert(repository != null);

  final _post = MyModel().obs;
  get post => this._post.value;
  set post(value) => this._post.value = value;

  //pratique
  editar(post) {
    print('editar');
  }

  //pratique
  delete(id) {
    print('deletar');
  }
}
