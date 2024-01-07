
import 'package:economy_v2/app/modules/auth/auth_controller.dart';
import 'package:economy_v2/app/modules/auth/login/login_module.dart';
import 'package:economy_v2/app/modules/auth/register/register_module.dart';
import 'package:economy_v2/app/modules/auth/splash/splash_home_page.dart';
import 'package:economy_v2/app/repositories/wallet/wallet_repository.dart';
import 'package:economy_v2/app/repositories/wallet/wallet_repository_impl.dart';
import 'package:economy_v2/app/services/user/user_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module{

  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<UserServiceImpl>((i) => UserServiceImpl()),
    Bind.lazySingleton<WalletRepository>((i) => WalletRepositoryImpl()),
    Bind.lazySingleton((i) => AuthController(userService: i(), repository: i()))
    
  ];


  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => SplashAuthPage(authController: Modular.get()),),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/register', module: RegisterModule())
  ];


}