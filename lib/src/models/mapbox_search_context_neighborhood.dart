import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// A class representing neighborhood information in the Mapbox search context
class MapboxSearchContextNeighborhood {
  /// The Mapbox ID of the neighborhood
  final String? mapboxId;

  /// The name associated with the neighborhood
  final String name;

  /// Optional translations associated with the neighborhood
  final Json? translations;

  /// Constructor for creating a MapboxSearchContextNeighborhood instance
  const MapboxSearchContextNeighborhood(
      {this.mapboxId, required this.name, this.translations});

  /// Factory method for creating a MapboxSearchContextNeighborhood instance from a JSON object
  factory MapboxSearchContextNeighborhood.fromJson(Json json) {
    return MapboxSearchContextNeighborhood(
        mapboxId: json['mapbox_id'] as String?,
        name: json['name'] as String,
        translations: json['translations'] as Json?);
  }
}
