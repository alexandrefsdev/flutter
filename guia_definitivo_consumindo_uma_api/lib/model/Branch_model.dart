import 'dart:convert';

class Branch {
  int id;
  String name;

  Branch({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Branch.fromMap(Map<String, dynamic> map) {
    return Branch(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Branch.fromJson(String source) => Branch.fromMap(json.decode(source));
}
