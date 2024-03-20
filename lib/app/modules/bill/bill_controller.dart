import 'package:mobx/mobx.dart';

import '../../core/models/bill.dart';
import '../../core/ui/messages.dart';
import '../../services/bill/bill_service.dart';

part 'bill_controller.g.dart';

class BillController = BillControllerBase with _$BillController;

abstract class BillControllerBase with Store {
  final BillService _service;

  BillControllerBase({required BillService service}) : _service = service;

  @action
  Future<void> createBill({required Bill bill, required int repeatNum}) async {
    try {
      await _service.createBill(bill: bill, repeatNum: repeatNum);
      Messages.success("Despesa cadastrada com sucesso!");
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }

   @action
  Future<void> updateBill({required Bill bill}) async {
    try {
      await _service.updateBill(bill: bill);
      Messages.success("Despesa alterada com sucesso!");
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }
}
