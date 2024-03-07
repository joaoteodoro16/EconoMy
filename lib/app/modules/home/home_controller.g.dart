// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  Computed<double>? _$totalWalletComputed;

  @override
  double get totalWallet =>
      (_$totalWalletComputed ??= Computed<double>(() => super.totalWallet,
              name: 'HomeControllerBase.totalWallet'))
          .value;
  Computed<double>? _$totalBillComputed;

  @override
  double get totalBill =>
      (_$totalBillComputed ??= Computed<double>(() => super.totalBill,
              name: 'HomeControllerBase.totalBill'))
          .value;
  Computed<double>? _$totalRemainingComputed;

  @override
  double get totalRemaining =>
      (_$totalRemainingComputed ??= Computed<double>(() => super.totalRemaining,
              name: 'HomeControllerBase.totalRemaining'))
          .value;
  Computed<List<Bill>>? _$billsComputed;

  @override
  List<Bill> get bills =>
      (_$billsComputed ??= Computed<List<Bill>>(() => super.bills,
              name: 'HomeControllerBase.bills'))
          .value;
  Computed<Wallet?>? _$walletComputed;

  @override
  Wallet? get wallet =>
      (_$walletComputed ??= Computed<Wallet?>(() => super.wallet,
              name: 'HomeControllerBase.wallet'))
          .value;

  late final _$_billsAtom =
      Atom(name: 'HomeControllerBase._bills', context: context);

  @override
  List<Bill> get _bills {
    _$_billsAtom.reportRead();
    return super._bills;
  }

  @override
  set _bills(List<Bill> value) {
    _$_billsAtom.reportWrite(value, super._bills, () {
      super._bills = value;
    });
  }

  late final _$_totalWalletAtom =
      Atom(name: 'HomeControllerBase._totalWallet', context: context);

  @override
  double get _totalWallet {
    _$_totalWalletAtom.reportRead();
    return super._totalWallet;
  }

  @override
  set _totalWallet(double value) {
    _$_totalWalletAtom.reportWrite(value, super._totalWallet, () {
      super._totalWallet = value;
    });
  }

  late final _$_totalBillAtom =
      Atom(name: 'HomeControllerBase._totalBill', context: context);

  @override
  double get _totalBill {
    _$_totalBillAtom.reportRead();
    return super._totalBill;
  }

  @override
  set _totalBill(double value) {
    _$_totalBillAtom.reportWrite(value, super._totalBill, () {
      super._totalBill = value;
    });
  }

  late final _$_totalRemainingAtom =
      Atom(name: 'HomeControllerBase._totalRemaining', context: context);

  @override
  double get _totalRemaining {
    _$_totalRemainingAtom.reportRead();
    return super._totalRemaining;
  }

  @override
  set _totalRemaining(double value) {
    _$_totalRemainingAtom.reportWrite(value, super._totalRemaining, () {
      super._totalRemaining = value;
    });
  }

  late final _$_walletAtom =
      Atom(name: 'HomeControllerBase._wallet', context: context);

  @override
  Wallet? get _wallet {
    _$_walletAtom.reportRead();
    return super._wallet;
  }

  @override
  set _wallet(Wallet? value) {
    _$_walletAtom.reportWrite(value, super._wallet, () {
      super._wallet = value;
    });
  }

  late final _$getAllAsyncAction =
      AsyncAction('HomeControllerBase.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$deleteByIdAsyncAction =
      AsyncAction('HomeControllerBase.deleteById', context: context);

  @override
  Future<void> deleteById({required Bill bill}) {
    return _$deleteByIdAsyncAction.run(() => super.deleteById(bill: bill));
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void calculateValues() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.calculateValues');
    try {
      return super.calculateValues();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWalletValue(Wallet wallet) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setWalletValue');
    try {
      return super.setWalletValue(wallet);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalWallet: ${totalWallet},
totalBill: ${totalBill},
totalRemaining: ${totalRemaining},
bills: ${bills},
wallet: ${wallet}
    ''';
  }
}
