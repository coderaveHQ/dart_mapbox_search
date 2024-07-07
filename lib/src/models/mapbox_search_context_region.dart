import 'package:dart_mapbox_search/src/utils/typdefs.dart';

// A class representing region information in the Mapbox search context
class MapboxSearchContextRegion {
  // The Mapbox ID of the region
  final String? mapboxId;

  // The name associated with the region
  final String name;

  // The region code
  final String regionCode;

  // The full region code
  final String regionCodeFull;

  // Translations associated with the region
  final Json? translations;

  // Constructor for creating a MapboxSearchContextRegion instance
  const MapboxSearchContextRegion(
      {this.mapboxId,
      required this.name,
      required this.regionCode,
      required this.regionCodeFull,
      this.translations});

  // Factory method for creating a MapboxSearchContextRegion instance from a JSON object
  factory MapboxSearchContextRegion.fromJson(Json json) {
    return MapboxSearchContextRegion(
        mapboxId: json['mapbox_id'] as String?,
        name: json['name'] as String,
        regionCode: json['region_code'] as String,
        regionCodeFull: json['region_code_full'] as String,
        translations: json['translations'] as Json?);
  }
}
