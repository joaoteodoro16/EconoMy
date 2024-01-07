import 'package:economy_v2/app/core/models/bill.dart';
import 'package:economy_v2/app/repositories/bill/bill_repository.dart';

import './bill_service.dart';

class BillServiceImpl extends BillService {

  final BillRepository _repository;

  BillServiceImpl({required BillRepository repository}) : _repository =  repository;

  @override
  Future<List<Bill>> getAll() => _repository.getAll();
  
  @override
  Future<void> createBill({required Bill bill}) => _repository.createBill(bill: bill);
  
  @override
  Future<void> deleteById({required Bill bill}) => _repository.deleteById(bill: bill);
  
  @override
  Future<void> updateBill({required Bill bill})=> _repository.updateBill(bill: bill);
  
}