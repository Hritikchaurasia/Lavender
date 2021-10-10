import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:lavender/data/series/episode.dart';

class Seasons {
  final String seasonName;
  final String seasonDescription;
  final String seasonLogo;
  final List<Episode> episodes;
  const Seasons({
    @required this.seasonName,
    @required this.seasonDescription,
    @required this.seasonLogo,
    @required this.episodes,
  });

  Seasons copyWith({
    String seasonName,
    String seasonDescription,
    String seasonLogo,
    List<Episode> episodes,
  }) {
    return Seasons(
      seasonName: seasonName ?? this.seasonName,
      seasonDescription: seasonDescription ?? this.seasonDescription,
      seasonLogo: seasonLogo ?? this.seasonLogo,
      episodes: episodes ?? this.episodes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'seasonName': seasonName,
      'seasonDescription': seasonDescription,
      'seasonLogo': seasonLogo,
      'episodes': episodes?.map((x) => x.toMap())?.toList(),
    };
  }

  factory Seasons.fromMap(Map<String, dynamic> map) {
    return Seasons(
      seasonName: map['seasonName'],
      seasonDescription: map['seasonDescription'],
      seasonLogo: map['seasonLogo'],
      episodes: List<Episode>.from(map['episodes']?.map((x) => Episode.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Seasons.fromJson(String source) => Seasons.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Seasons(seasonName: $seasonName, seasonDescription: $seasonDescription, seasonLogo: $seasonLogo, episodes: $episodes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Seasons &&
      other.seasonName == seasonName &&
      other.seasonDescription == seasonDescription &&
      other.seasonLogo == seasonLogo &&
      listEquals(other.episodes, episodes);
  }

  @override
  int get hashCode {
    return seasonName.hashCode ^
      seasonDescription.hashCode ^
      seasonLogo.hashCode ^
      episodes.hashCode;
  }
}
