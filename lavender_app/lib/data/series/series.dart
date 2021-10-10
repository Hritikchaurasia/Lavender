import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'seasons.dart';

class Series {
  final String name;
  final String logo;
  final List<Seasons> seasons;
  final String language;
  final String description;
  Series({
    @required this.name,
    @required this.logo,
    @required this.seasons,
    @required this.language,
    @required this.description,
  });

  Series copyWith({
    String name,
    String logo,
    List<Seasons> seasons,
    String language,
    String description,
  }) {
    return Series(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      seasons: seasons ?? this.seasons,
      language: language ?? this.language,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'logo': logo,
      'seasons': seasons?.map((x) => x.toMap())?.toList(),
      'language': language,
      'description': description,
    };
  }

  factory Series.fromMap(Map<String, dynamic> map) {
    return Series(
      name: map['name'],
      logo: map['logo'],
      seasons: List<Seasons>.from(map['seasons']?.map((x) => Seasons.fromMap(x))),
      language: map['language'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Series.fromJson(String source) => Series.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Series(name: $name, logo: $logo, seasons: $seasons, language: $language, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Series &&
      other.name == name &&
      other.logo == logo &&
      listEquals(other.seasons, seasons) &&
      other.language == language &&
      other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      logo.hashCode ^
      seasons.hashCode ^
      language.hashCode ^
      description.hashCode;
  }
}
