import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Movie {
  final String name;
  final String logo;
  final String url;
  final String language;
  final String description;
  const Movie({
    @required this.name,
    @required this.logo,
    @required this.url,
    @required this.language,
    @required this.description,
  });

  Movie copyWith({
    String name,
    String logo,
    String url,
    String language,
    String description,
  }) {
    return Movie(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      url: url ?? this.url,
      language: language ?? this.language,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'logo': logo,
      'url': url,
      'language': language,
      'description': description,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      name: map['name'],
      logo: map['logo'],
      url: map['url'],
      language: map['language'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Movie(name: $name, logo: $logo, url: $url, language: $language, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.name == name &&
        other.logo == logo &&
        other.url == url &&
        other.language == language &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        logo.hashCode ^
        url.hashCode ^
        language.hashCode ^
        description.hashCode;
  }
}
