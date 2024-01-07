import 'package:mobx/mobx.dart';

import '../../../services/user/user_service.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {

  final UserService _userService;

  _RegisterController({required UserService userService}) : _userService = userService;

  Future<void> signUp({required String email, required String password}) async {
    await _userService.signUp(email: email, password: password);
  }
}