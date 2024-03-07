import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Wallet {
  
  final int? id;
   double value;
  
  Wallet({
    this.id,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'value': value,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      id: map['id'] != null ? map['id'] as int : null,
      value: map['value'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) => Wallet.fromMap(json.decode(source) as Map<String, dynamic>);
}
