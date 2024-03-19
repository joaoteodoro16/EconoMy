import 'package:economy_v2/app/core/models/wallet.dart';
import 'package:economy_v2/app/repositories/wallet/wallet_repository.dart';
import 'package:economy_v2/app/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {

  final WalletRepository _repository;

  AuthControllerBase(
      {required UserService userService, required WalletRepository repository})
      : 
        _repository = repository;

  @readonly
  bool? _userIsAuthenticated;
  
  Wallet? wallet;

  @action
  Future<void> isAuthenticate() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.authStateChanges().listen((user) async{
      if (user != null) {
        _userIsAuthenticated = true;
      } else {
        _userIsAuthenticated = false;
      }
    });
  }
}
