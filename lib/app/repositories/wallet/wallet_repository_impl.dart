import 'package:economy_v2/app/core/database/db.dart';
import 'package:economy_v2/app/core/models/wallet.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

import './wallet_repository.dart';

class WalletRepositoryImpl extends WalletRepository {
  late Database _db;

  @override
  Future<void> save(Wallet wallet) async {
    try {
      _db = await DB.instance.database;

      final search =
          await _db.query("wallet", where: "month = ${wallet.month}");

      if (search.isNotEmpty) {
        await _db.update(
          'wallet',
          {
            'value': wallet.value,
            'month': wallet.month,
            'year': wallet.year,
          },
          where: 'id = ?',
          whereArgs: [search[0]['id']],
        );
      } else {
        await _db.insert(
          'wallet',
          {
            'value': wallet.value,
            'month': wallet.month,
            'year': wallet.year,
          },
        );
      }
    } on Exception catch (e) {
      Logger().e("WalletRepositoryImpl - save ", error: e.toString());
      throw Exception("Erro ao salvar a carteira!");
    }
  }

  Future<Wallet?> getByMonthAndYear(int year, int month) async {
    try {
      _db = await DB.instance.database;

      Wallet? wallet;

      final result = await _db.query("wallet",
          where: "month = ? AND year = ?", whereArgs: [month, year]);

      if (result.isNotEmpty) {
        wallet = Wallet.fromMap(result[0]);
      }
      return wallet;
    } on Exception catch (e) {
          Logger().e("WalletRepositoryImpl - getByMonthAndYear ", error: e.toString());
          throw Exception("Erro ao buscar informações da carteira!");
    }
  }
}
