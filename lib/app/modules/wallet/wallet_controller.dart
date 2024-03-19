import 'package:economy_v2/app/core/models/wallet.dart';
import 'package:economy_v2/app/core/ui/messages.dart';
import 'package:economy_v2/app/services/wallet/wallet_service.dart';
import 'package:mobx/mobx.dart';

part 'wallet_controller.g.dart';

class WalletController = WalletControllerBase with _$WalletController;

abstract class WalletControllerBase with Store {
  final WalletService _service;

  WalletControllerBase({required WalletService service}) : _service = service;

  Future<void> save(Wallet wallet) async {
    try {
      await _service.save(wallet);
      Messages.success("Carteira salva com sucesso!");
    } on Exception catch (e) {
      Messages.alert(e.toString());
    }
  }
}
