import 'dart:convert';

class Source {
  Source({
    required this.id,
    required this.name,
  });

  final String? id;
  final String name;

  factory Source.fromJson(String str) => Source.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
