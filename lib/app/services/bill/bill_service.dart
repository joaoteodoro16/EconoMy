import '../../core/models/bill.dart';

abstract class BillService {
  Future<List<Bill>> getAll();
  Future<void> createBill({required Bill bill, required int repeatNum});
  Future<void> deleteById({required Bill bill});
  Future<void> updateBill({required Bill bill});
  Future<List<Bill>> getByDateFilter(int year, int month);
}