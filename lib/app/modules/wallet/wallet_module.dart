
import 'package:economy_v2/app/modules/wallet/wallet_controller.dart';
import 'package:economy_v2/app/modules/wallet/wallet_page.dart';
import 'package:economy_v2/app/repositories/wallet/wallet_repository.dart';
import 'package:economy_v2/app/repositories/wallet/wallet_repository_impl.dart';
import 'package:economy_v2/app/services/wallet/wallet_service.dart';
import 'package:economy_v2/app/services/wallet/wallet_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WalletModule extends Module{
  
  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<WalletRepository>((i) => WalletRepositoryImpl()),
    Bind.lazySingleton<WalletService>((i) => WalletServiceImpl(repository: i())),
    Bind.lazySingleton((i) => WalletController(service: i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) =>  const WalletPage(),)
  ];


}