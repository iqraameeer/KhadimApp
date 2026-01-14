// lib/models/city_search_model.dart

class CitySearchModel {
  final String placeId;
  final String licence;
  final String osmType;
  final String osmId;
  final double lat;
  final double lon;
  final String className;
  final String type;
  final int placeRank;
  final double importance;
  final String addressType;
  final String name;
  final String displayName;
  final List<String> boundingBox;

  CitySearchModel({
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.lat,
    required this.lon,
    required this.className,
    required this.type,
    required this.placeRank,
    required this.importance,
    required this.addressType,
    required this.name,
    required this.displayName,
    required this.boundingBox,
  });

  factory CitySearchModel.fromJson(Map<String, dynamic> json) {
    return CitySearchModel(
      placeId: json['place_id']?.toString() ?? '',
      licence: json['licence']?.toString() ?? '',
      osmType: json['osm_type']?.toString() ?? '',
      osmId: json['osm_id']?.toString() ?? '',
      lat: double.tryParse(json['lat']?.toString() ?? '0') ?? 0.0,
      lon: double.tryParse(json['lon']?.toString() ?? '0') ?? 0.0,
      className: json['class']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      placeRank: json['place_rank'] is int ? json['place_rank'] : 0,
      importance: double.tryParse(json['importance']?.toString() ?? '0') ?? 0.0,
      addressType: json['addresstype']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      displayName: json['display_name']?.toString() ?? '',
      boundingBox: json['boundingbox'] is List
          ? List<String>.from(json['boundingbox'])
          : [],
    );
  }

  static List<CitySearchModel> fromJsonList(dynamic raw) {
    if (raw is! List) return [];
    return raw
        .where((e) => e is Map<String, dynamic>)
        .map((e) => CitySearchModel.fromJson(e))
        .toList();
  }
}