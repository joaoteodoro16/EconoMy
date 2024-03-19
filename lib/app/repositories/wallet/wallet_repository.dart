import 'package:economy_v2/app/core/models/wallet.dart';

abstract class WalletRepository {

    Future<void> save(Wallet wallet);
    Future<Wallet?> getByMonthAndYear(int year, int month);

}  