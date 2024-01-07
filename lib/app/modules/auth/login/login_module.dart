
import 'package:economy_v2/app/modules/auth/login/login_controller.dart';
import 'package:economy_v2/app/modules/auth/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module{

  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton((i) => LoginController(service: i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const LoginPage(),)
  ];

}