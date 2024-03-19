import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Wallet {
  
  final int? id;
  double value;
  final int month;
  final int year;

  Wallet({
    this.id,
    required this.value,
    required this.month,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
      'month': month,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      id: map['id']?.toInt(),
      value: map['value']?.toDouble() ?? 0.0,
      month: map['month']?.toInt() ?? 0,
      year: map['year']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) => Wallet.fromMap(json.decode(source));
}
