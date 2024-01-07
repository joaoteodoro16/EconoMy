import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Category {
  
  final int id;
  final String name;
  final String color;

  Category({
    required this.id,
    required this.name,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'color': color,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      color: map['color'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
