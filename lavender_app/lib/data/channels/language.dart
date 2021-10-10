import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Language {
  final String code;
  final String name;
  const Language({
    @required this.code,
    @required this.name,
  });

  Language copyWith({
    String code,
    String name,
  }) {
    return Language(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      code: map['code'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) => Language.fromMap(json.decode(source));

  @override
  String toString() => 'Language(code: $code, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Language &&
      other.code == code &&
      other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;
}