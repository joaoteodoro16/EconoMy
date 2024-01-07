
import 'package:economy_v2/app/modules/bill/bill_controller.dart';
import 'package:economy_v2/app/modules/bill/bill_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/bill/bill_repository.dart';
import '../../repositories/bill/bill_repository_impl.dart';
import '../../services/bill/bill_service.dart';
import '../../services/bill/bill_service_impl.dart';

class BillModule extends Module{
  
  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton<BillRepository>((i) => BillRepositoryImpl()),
    Bind.lazySingleton<BillService>((i) => BillServiceImpl(repository: i())),
    Bind.lazySingleton((i) => BillController(service: i()))
  ];


  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) {
      return BillPage(billUpdate: args.data,);
    },)
  ];

}