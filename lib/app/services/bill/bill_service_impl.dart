import 'package:economy_v2/app/core/models/bill.dart';
import 'package:economy_v2/app/core/utils/DateUtil.dart';
import 'package:economy_v2/app/repositories/bill/bill_repository.dart';

import './bill_service.dart';

class BillServiceImpl extends BillService {
  final BillRepository _repository;

  BillServiceImpl({required BillRepository repository})
      : _repository = repository;

  @override
  Future<List<Bill>> getAll() => _repository.getAll();

  @override
  Future<void> createBill({required Bill bill, required int repeatNum}) async {
    DateTime date = bill.expireIn;

    for (int i = 1; i <= repeatNum; i++) {
      bill.expireIn = date;
      await _repository.createBill(bill: bill);

      date = DateTime(date.year, date.month + 1, date.day);

      if (date.month == 12) {
        date = DateTime(date.year + 1, 1, date.day);
      }
    }

    return;
  }

  @override
  Future<void> deleteById({required Bill bill}) =>
      _repository.deleteById(bill: bill);

  @override
  Future<void> updateBill({required Bill bill}) =>
      _repository.updateBill(bill: bill);

  @override
  Future<List<Bill>> getByDateFilter(int age, int month) {
    DateTime startDate = DateTime(age, month, 1);
    DateTime endDate;

    if (month == 12) {
      endDate = DateTime(age + 1, 1, 1).subtract(const Duration(days: 1));
    } else {
      endDate = DateTime(age, month + 1, 1).subtract(const Duration(days: 1));
    }

    return _repository.getByDateFilter(startDate, endDate);
  }
}
