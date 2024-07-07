import 'package:dart_mapbox_search/src/models/mapbox_search_feature_geometry.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';
import 'package:dart_mapbox_search/src/models/search/mapbox_search_search_feature_properties.dart';

// Represents a feature from a search request
class MapboxSearchSearchFeature {
  // This will always be "Feature".
  final String type;

  // An object describing the spatial geometry of the returned feature.
  final MapboxSearchFeatureGeometry geometry;

  // The specific properties associated with the returned feature.
  final MapboxSearchSearchFeatureProperties properties;

  // Constructor for MapboxSearchSearchFeature
  const MapboxSearchSearchFeature(
      {required this.type, required this.geometry, required this.properties});

  // Factory method to create MapboxSearchSearchFeature from JSON data
  factory MapboxSearchSearchFeature.fromJson(Json json) {
    return MapboxSearchSearchFeature(
        type: json['type'] as String,
        geometry:
            MapboxSearchFeatureGeometry.fromJson(json['geometry'] as Json),
        properties: MapboxSearchSearchFeatureProperties.fromJson(
            json['properties'] as Json));
  }
}
