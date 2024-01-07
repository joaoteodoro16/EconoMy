
import 'package:economy_v2/app/modules/home/home_controller.dart';
import 'package:economy_v2/app/modules/home/home_page.dart';
import 'package:economy_v2/app/repositories/bill/bill_repository.dart';
import 'package:economy_v2/app/repositories/bill/bill_repository_impl.dart';
import 'package:economy_v2/app/services/bill/bill_service.dart';
import 'package:economy_v2/app/services/bill/bill_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{

  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<BillRepository>((i) => BillRepositoryImpl()),
    Bind.lazySingleton<BillService>((i) => BillServiceImpl(repository: i())),
    Bind.lazySingleton((i) => HomeController(service: i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage(wallet: args.data),)
  ];
  
}