import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Episode {
  final String episodeName;
  final String episodeDescription;
  final String episodeUrl;
  final String episodeLogo;
  const Episode({
    @required this.episodeName,
    @required this.episodeDescription,
    @required this.episodeUrl,
    @required this.episodeLogo,
  });

  Episode copyWith({
    String episodeName,
    String episodeDescription,
    String episodeUrl,
    String episodeLogo,
  }) {
    return Episode(
      episodeName: episodeName ?? this.episodeName,
      episodeDescription: episodeDescription ?? this.episodeDescription,
      episodeUrl: episodeUrl ?? this.episodeUrl,
      episodeLogo: episodeLogo ?? this.episodeLogo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'episodeName': episodeName,
      'episodeDescription': episodeDescription,
      'episodeUrl': episodeUrl,
      'episodeLogo': episodeLogo,
    };
  }

  factory Episode.fromMap(Map<String, dynamic> map) {
    return Episode(
      episodeName: map['episodeName'],
      episodeDescription: map['episodeDescription'],
      episodeUrl: map['episodeUrl'],
      episodeLogo: map['episodeLogo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Episode.fromJson(String source) => Episode.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Episode(episodeName: $episodeName, episodeDescription: $episodeDescription, episodeUrl: $episodeUrl, episodeLogo: $episodeLogo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Episode &&
      other.episodeName == episodeName &&
      other.episodeDescription == episodeDescription &&
      other.episodeUrl == episodeUrl &&
      other.episodeLogo == episodeLogo;
  }

  @override
  int get hashCode {
    return episodeName.hashCode ^
      episodeDescription.hashCode ^
      episodeUrl.hashCode ^
      episodeLogo.hashCode;
  }
}
