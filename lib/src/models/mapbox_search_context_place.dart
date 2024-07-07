import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// A class representing place information in the Mapbox search context
class MapboxSearchContextPlace {
  /// The Mapbox ID of the place
  final String? mapboxId;

  /// The name associated with the place
  final String name;

  /// Optional translations associated with the place
  final Json? translations;

  /// Constructor for creating a MapboxSearchContextPlace instance
  const MapboxSearchContextPlace(
      {this.mapboxId, required this.name, this.translations});

  /// Factory method for creating a MapboxSearchContextPlace instance from a JSON object
  factory MapboxSearchContextPlace.fromJson(Json json) {
    return MapboxSearchContextPlace(
        mapboxId: json['mapbox_id'] as String?,
        name: json['name'] as String,
        translations: json['translations'] as Json?);
  }
}
