import 'package:estudando_getxx/api/users_api.dart';
import 'package:estudando_getxx/models/user.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users = [];
  bool _loading = true;

  bool get loading => _loading;
  int get counter => _counter;
  List<User> get users => _users;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('same as initState');
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print('onReady');
    this.loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UsersApi.instance.getUsers(1);
    this._users = data!;
    this._loading = false;
    update(['users']);
  }

  void increment() {
    this._counter++;
    update(['text']);
  }
}
