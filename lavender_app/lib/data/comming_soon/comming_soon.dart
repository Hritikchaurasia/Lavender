import 'dart:convert';

class CommingSoon {
  final String name;
  final String logo;
  final String releaseDate;

  const CommingSoon(
   this.name,
   this.logo,
   this.releaseDate,
  );

  CommingSoon copyWith({
    String name,
    String logo,
    String releaseDate,
  }) {
    return CommingSoon(
      name ?? this.name,
      logo ?? this.logo,
      releaseDate ?? this.releaseDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'logo': logo,
      'releaseDate': releaseDate,
    };
  }

  factory CommingSoon.fromMap(Map<String, dynamic> map) {
    return CommingSoon(
      map['name'],
      map['logo'],
      map['releaseDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CommingSoon.fromJson(String source) => CommingSoon.fromMap(json.decode(source));

  @override
  String toString() => 'CommingSoon(name: $name, logo: $logo, releaseDate: $releaseDate)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CommingSoon &&
      other.name == name &&
      other.logo == logo &&
      other.releaseDate == releaseDate;
  }

  @override
  int get hashCode => name.hashCode ^ logo.hashCode ^ releaseDate.hashCode;
}
