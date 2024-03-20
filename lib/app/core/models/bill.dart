import 'dart:convert';

import 'category.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Bill {
   final int? id;
  final String description;
  final double value;
  DateTime expireIn;
  final String observation;

  
  Bill({
    this.id,
    required this.description,
    required this.value,
    required this.expireIn,
    required this.observation,

  });
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'value': value,
      'expireIn': expireIn.millisecondsSinceEpoch,
      'observation': observation,
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      id: map['id'] as int,
      description: map['description'] as String,
      value: map['value'] as double,
      expireIn: DateTime.parse(map['expireIn']),
      observation: map['observation'] as String,
    );
  }

  factory Bill.fromMapCategory(Map<String, dynamic> map) {
    return Bill(
      id: map['id'] as int,
      description: map['description'] as String,
      value: map['value'] as double,
      expireIn: DateTime.parse(map['expireIn']),
      observation: map['observation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bill.fromJson(String source) => Bill.fromMap(json.decode(source) as Map<String, dynamic>);
}
