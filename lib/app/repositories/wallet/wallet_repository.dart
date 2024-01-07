import 'package:economy_v2/app/core/models/wallet.dart';

abstract class WalletRepository {

    Future<Wallet?> getAll();  
    Future<void> registerWallet(Wallet wallet);
    Future<void> updateWallet(Wallet wallet);

}