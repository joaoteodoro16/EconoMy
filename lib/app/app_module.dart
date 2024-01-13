import 'package:economy_v2/app/modules/auth/auth_module.dart';
import 'package:economy_v2/app/modules/bill/bill_module.dart';
import 'package:economy_v2/app/modules/home/home_module.dart';
import 'package:economy_v2/app/modules/wallet/wallet_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{
  
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/wallet', module: WalletModule()),
    ModuleRoute('/bill', module: BillModule()),
    
  ];

}