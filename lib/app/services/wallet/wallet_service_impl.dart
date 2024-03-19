import 'package:economy_v2/app/core/models/wallet.dart';
import 'package:economy_v2/app/repositories/wallet/wallet_repository.dart';

import './wallet_service.dart';

class WalletServiceImpl extends WalletService {

  final WalletRepository _repository;

  WalletServiceImpl({required WalletRepository repository}) : _repository =  repository;

  @override
  Future<void> save(Wallet wallet) => _repository.save(wallet);
  
  @override
  Future<Wallet?> getByMonthAndYear(int year, int month) => _repository.getByMonthAndYear(year, month);

}