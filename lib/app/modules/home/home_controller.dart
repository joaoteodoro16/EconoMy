import 'package:economy_v2/app/core/models/wallet.dart';
import 'package:economy_v2/app/services/bill/bill_service.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/bill.dart';
import '../../core/ui/messages.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final BillService _service;

  HomeControllerBase({required BillService service}) : _service = service;

  @observable
  List<Bill> _bills = [];

  @observable
  double _totalWallet = 0;
  @observable
  double _totalBill = 0;
  @observable
  double _totalRemaining = 0;

  @computed
  double get totalWallet => _totalWallet;
  @computed
  double get totalBill => _totalBill;
  @computed
  double get totalRemaining => _totalRemaining;

  @computed
  List<Bill> get bills => _bills;


  @action
  Future<void> getAll(Wallet wallet) async {
    try {
      _bills = await _service.getAll();
      _totalWallet = wallet.value;
      calculateValues();
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }

  @action
  Future<void> deleteById({required Bill bill}) async {
    try {
      await _service.deleteById(bill: bill);
      _bills.removeWhere((billList) => billList.id == bill.id);
      final newBillList = _bills;
      _bills = [...newBillList];
      calculateValues();
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }

  @action
  void calculateValues(){
      _totalRemaining = 0;
      _totalBill = 0; 

      for (var bill in _bills) {
        _totalBill = _totalBill + bill.value;        
      }
      _totalRemaining = _totalWallet - _totalBill;

  }

 
}
