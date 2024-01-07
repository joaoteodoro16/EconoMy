import 'dart:convert';

import 'category.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Bill {
   final int? id;
  final String description;
  final double value;
  final DateTime expireIn;
  final String observation;
  final Category category;
  final double discount;
  final int paidOut;
  
  Bill({
    this.id,
    required this.description,
    required this.value,
    required this.expireIn,
    required this.observation,
    required this.category,
    required this.discount,
    required this.paidOut,
  });
  
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'value': value,
      'expireIn': expireIn.millisecondsSinceEpoch,
      'observation': observation,
      'category': category.toMap(),
      'discount': discount,
      'paidOut': paidOut,
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      id: map['id'] as int,
      description: map['description'] as String,
      value: map['value'] as double,
      expireIn: DateTime.parse(map['expireIn']),
      observation: map['observation'] as String,
      category: Category.fromMap(map['category'] as Map<String,dynamic>),
      discount: map['discount'] as double,
      paidOut: map['paidOut'] as int,
    );
  }

  factory Bill.fromMapCategory(Map<String, dynamic> map) {
    return Bill(
      id: map['id'] as int,
      description: map['description'] as String,
      value: map['value'] as double,
      expireIn: DateTime.parse(map['expireIn']),
      observation: map['observation'] as String,
      category: Category(id: map['category'] as int, color: "", name: ""),
      discount: map['discount'] as double,
      paidOut: map['paidOut'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bill.fromJson(String source) => Bill.fromMap(json.decode(source) as Map<String, dynamic>);
}
