class School {
  final String semisCode;
  final String schoolName;
  final String district;
  final String tehsil;
  final String unionCouncil;
  final String level;
  final String gender;
  final double latitude;
  final double longitude;
  final bool isActive;

  School({
    required this.semisCode,
    required this.schoolName,
    required this.district,
    required this.tehsil,
    required this.unionCouncil,
    required this.level,
    required this.gender,
    required this.latitude,
    required this.longitude,
    required this.isActive,
  });

  factory School.fromMap(Map<String, dynamic> map) {
    return School(
      semisCode: map['semisCode'],
      schoolName: map['schoolName'],
      district: map['district'],
      tehsil: map['tehsil'],
      unionCouncil: map['unionCouncil'],
      level: map['level'],
      gender: map['gender'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      isActive: map['active'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'semisCode': semisCode,
      'schoolName': schoolName,
      'district': district,
      'tehsil': tehsil,
      'unionCouncil': unionCouncil,
      'level': level,
      'gender': gender,
      'latitude': latitude,
      'longitude': longitude,
      'active': isActive ? 1 : 0,
    };
  }
}
