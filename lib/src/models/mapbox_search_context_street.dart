import 'package:dart_mapbox_search/src/utils/typdefs.dart';

// A class representing street information in the Mapbox search context
class MapboxSearchContextStreet {
  // The Mapbox ID of the street
  final String? mapboxId;

  // The name associated with the street
  final String name;

  // Constructor for creating a MapboxSearchContextStreet instance
  const MapboxSearchContextStreet({this.mapboxId, required this.name});

  // Factory method for creating a MapboxSearchContextStreet instance from a JSON object
  factory MapboxSearchContextStreet.fromJson(Json json) {
    return MapboxSearchContextStreet(
        mapboxId: json['mapbox_id'] as String?, name: json['name'] as String);
  }
}
