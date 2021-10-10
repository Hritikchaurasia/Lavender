import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'language.dart';

class Channel {
  final String name;
  final String logo;
  final String url;
  final String category;
 

  const Channel({
    @required this.name,
    @required this.logo,
    @required this.url,
    @required this.category,
   
  });

  Channel copyWith({
    String name,
    String logo,
    String url,
    String category,
    List<Language> languages,
  }) {
    return Channel(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      url: url ?? this.url,
      category: category ?? this.category,
     
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'logo': logo,
      'url': url,
      'category': category,
      
    };
  }

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      name: map['name'] as String,
      logo: map['logo'] as String,
      url: map['url'] as String,
      category: map['category'] as String,
     
    );
  }

  String toJson() => json.encode(toMap());

  factory Channel.fromJson(String source) =>
      Channel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Channel(name: $name, logo: $logo, url: $url, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Channel &&
        other.name == name &&
        other.logo == logo &&
        other.url == url &&
        other.category == category;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        logo.hashCode ^
        url.hashCode ^
        category.hashCode;
  }
}
