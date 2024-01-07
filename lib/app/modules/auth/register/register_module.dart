
import 'package:economy_v2/app/modules/auth/register/register_controller.dart';
import 'package:economy_v2/app/modules/auth/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module{

  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton((i) => RegisterController(userService: i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const RegisterPage(),)
  ];
  
}