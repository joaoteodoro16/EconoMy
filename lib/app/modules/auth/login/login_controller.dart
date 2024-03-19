import 'package:mobx/mobx.dart';

import '../../../services/user/user_service.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final UserService _service;

  LoginControllerBase({required UserService service})
      : _service = service;


  @action
  Future<void> signIn({required String email, required String password})async {
    await _service.signIn(email: email, password: password);
  }

}