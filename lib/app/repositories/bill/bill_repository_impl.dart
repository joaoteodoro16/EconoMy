import 'package:economy_v2/app/core/database/db.dart';
import 'package:economy_v2/app/core/models/bill.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

import './bill_repository.dart';

class BillRepositoryImpl extends BillRepository {
  late Database _db;

  @override
  Future<List<Bill>> getAll() async {
    try {
      _db = await DB.instance.database;

      final result = await _db.query('bill',orderBy: 'expireIn DESC');

      List<Bill> bills = [];
      
      if (result.isNotEmpty) {
        for (var bill in result) {
          bills.add(Bill.fromMapCategory(bill));
        }
      }

      return bills;
    } on Exception catch (e) {
      Logger().e("BillRepository - getAll ", error: e.toString());
      throw Exception("Erro ao buscar as informações do banco de dados!");
    }
  }

  @override
  Future<void> createBill({required Bill bill}) async {
    try {
      _db = await DB.instance.database;

      await _db.execute(
          "INSERT INTO bill (description, value, expireIn, observation) VALUES (?,?,?,?)",
          [
            bill.description,
            bill.value.toString(),
            bill.expireIn.toIso8601String(),
            bill.observation
          ]);
    } on Exception catch (e) {
      Logger().e("BillRepository - createBill ", error: e.toString());
      throw Exception("Erro ao cadastrar a despesa!");
    }
  }

  @override
  Future<void> deleteById({required Bill bill}) async {
    try {
      await _db.execute("DELETE FROM bill WHERE id = ?", [bill.id]);
    } on Exception catch (e) {
      Logger().e("BillRepository - deleteById ", error: e.toString());
      throw Exception("Erro ao excluir a despesa!");
    }
  }

  @override
  Future<void> updateBill({required Bill bill}) async {
    try {
      _db = await DB.instance.database;

      await _db.update(
          'bill',
          {
            'description': bill.description,
            'value': bill.value.toString(),
            'expireIn': bill.expireIn.toIso8601String(),
            'observation': bill.observation,
          },
          where: 'id = ?',
          whereArgs: [bill.id]);
    } on Exception catch (e) {
      Logger().e("BillRepository - updateBill ", error: e.toString());
      throw Exception("Erro ao editar a despesa!");
    }
  }
  
  @override
  Future<List<Bill>> getByDateFilter(DateTime startDate, DateTime endDate) async{
    try {
      _db = await DB.instance.database;

      final result = await _db.query('bill',where: 'expireIn BETWEEN ? AND ?',orderBy: 'expireIn DESC',
      whereArgs: [
        startDate.toIso8601String(),
        endDate.toIso8601String(),
      ]);

      List<Bill> bills = [];
      
      if (result.isNotEmpty) {
        for (var bill in result) {
          bills.add(Bill.fromMapCategory(bill));
        }
      }

      return bills;

    } on Exception catch (e) {
      Logger().e("BillRepository - getByDateFilter ", error: e.toString());
      throw Exception("Erro ao buscar as despesas");
    }
  }
  
  
}
