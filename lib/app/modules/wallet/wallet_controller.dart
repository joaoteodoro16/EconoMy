import 'package:economy_v2/app/core/models/wallet.dart';
import 'package:economy_v2/app/core/ui/messages.dart';
import 'package:economy_v2/app/repositories/wallet/wallet_repository.dart';
import 'package:mobx/mobx.dart';

part 'wallet_controller.g.dart';

class WalletController = WalletControllerBase with _$WalletController;

abstract class WalletControllerBase with Store {
  final WalletRepository _repository;

  WalletControllerBase({required WalletRepository repository})
      : _repository = repository;

  @action
  Future<void> registerWallet(Wallet wallet) async {
    try {
      await _repository.registerWallet(wallet);
      Messages.success("Informações salvas com sucesso!");
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }

  @action
  Future<void> updateWallet(Wallet wallet) async {
    try {
      await _repository.updateWallet(wallet);
      Messages.success("Informações salvas com sucesso!");
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }
}
