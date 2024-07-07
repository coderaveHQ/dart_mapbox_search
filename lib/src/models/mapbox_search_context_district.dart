import 'package:dart_mapbox_search/src/utils/typdefs.dart';

// A class representing district information in the Mapbox search context
class MapboxSearchContextDistrict {
  // The Mapbox ID of the district
  final String? mapboxId;

  // The name associated with the district
  final String name;

  // Translations of the district name
  final Json? translations;

  // Constructor for creating a MapboxSearchContextDistrict instance
  const MapboxSearchContextDistrict(
      {this.mapboxId, required this.name, this.translations});

  // Factory method for creating a MapboxSearchContextDistrict instance from a JSON object
  factory MapboxSearchContextDistrict.fromJson(Json json) {
    return MapboxSearchContextDistrict(
        mapboxId: json['mapbox_id'] as String?,
        name: json['name'] as String,
        translations: json['translations'] as Json?);
  }
}
