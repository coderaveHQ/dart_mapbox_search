import 'package:dart_mapbox_search/src/utils/typdefs.dart';

// A class representing locality information in the Mapbox search context
class MapboxSearchContextLocality {
  // The Mapbox ID of the locality
  final String? mapboxId;

  // The name associated with the locality
  final String name;

  // Constructor for creating a MapboxSearchContextLocality instance
  const MapboxSearchContextLocality({this.mapboxId, required this.name});

  // Factory method for creating a MapboxSearchContextLocality instance from a JSON object
  factory MapboxSearchContextLocality.fromJson(Json json) {
    return MapboxSearchContextLocality(
        mapboxId: json['mapbox_id'] as String?, name: json['name'] as String);
  }
}
