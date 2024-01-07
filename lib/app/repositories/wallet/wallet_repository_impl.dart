import 'package:economy_v2/app/core/database/db.dart';
import 'package:economy_v2/app/core/models/wallet.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

import './wallet_repository.dart';

class WalletRepositoryImpl extends WalletRepository {
  late Database _db;

  @override
  Future<Wallet?> getAll() async {
    try {
      _db = await DB.instance.database;

      Wallet? wallet;

      final result = await _db.query("wallet");

      if (result.isNotEmpty) {
        wallet = Wallet.fromMap(result[0]);
      }
      return wallet;
    } on Exception catch (e) {
      Logger().e("WalletRepositoryImpl - getAll ", error: e.toString());
      throw Exception("Erro ao buscar informações da carteira!");
    }
  }

  @override
  Future<void> registerWallet(Wallet wallet) async {
    try {
      _db = await DB.instance.database;

      await _db.insert('wallet', {'value': wallet.value});
    } on Exception catch (e) {
      Logger().e("WalletRepositoryImpl - registerWallet ", error: e.toString());
      throw Exception("Erro ao cadastrar carteira");
    }
  }

  @override
  Future<void> updateWallet(Wallet wallet) async {
    try {
      _db = await DB.instance.database;
      await _db.update('wallet', {'value': wallet.value},
          where: 'id = ?', whereArgs: [wallet.id]);
    } on Exception catch (e) {
      Logger().e("WalletRepositoryImpl - updateWallet ", error: e.toString());
      throw Exception("Erro ao atualiazar carteira");
    }
  }
}
