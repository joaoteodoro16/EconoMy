import 'package:economy_v2/app/core/models/wallet.dart';
import 'package:economy_v2/app/services/bill/bill_service.dart';
import 'package:economy_v2/app/services/wallet/wallet_service.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/bill.dart';
import '../../core/ui/messages.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final BillService _service;
  final WalletService _walletService;

  HomeControllerBase(
      {required BillService service, required WalletService walletService})
      : _service = service,
        _walletService = walletService;

  @observable
  List<Bill> _bills = [];

  @observable
  double _totalWallet = 0;
  @observable
  double _totalBill = 0;
  @observable
  double _totalRemaining = 0;
  @observable
  Wallet? _wallet;
  @observable
  int _monthFilter = DateTime.now().month;
  @observable
  int _yearFilter = DateTime.now().year;

  @computed
  double get totalWallet => _totalWallet;
  @computed
  double get totalBill => _totalBill;
  @computed
  double get totalRemaining => _totalRemaining;

  @computed
  List<Bill> get bills => _bills;
  @computed
  Wallet? get wallet => _wallet;
  @computed
  int get monthFilter => _monthFilter;

  @computed
  int get yearFilter => _yearFilter;

  @action
  Future<void> getAll() async {
    try {
      _bills = await _service.getAll();
      _totalWallet = _wallet!.value;
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
  void calculateValues() {
    _totalRemaining = 0;
    _totalBill = 0;

    for (var bill in _bills) {
      _totalBill = _totalBill + bill.value;
    }
    _totalRemaining = _totalWallet - _totalBill;
  }

  @action
  Future<void> setWalletValue() async {
    try {
      _wallet =
          await _walletService.getByMonthAndYear(_yearFilter, _monthFilter);
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }

  @action
  Future<void> setDateFilter({int? year, int? month}) async {
    try {
      _bills = await _service.getByDateFilter(
          year ?? _yearFilter, month ?? _monthFilter);
      
      _monthFilter = month ?? _monthFilter;
      _yearFilter = year ?? _yearFilter;
      
      await setWalletValue();
      _totalWallet = _wallet?.value ?? 0;

      calculateValues();
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }
}
