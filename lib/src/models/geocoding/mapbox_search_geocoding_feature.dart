import 'package:dart_mapbox_search/src/models/mapbox_search_feature_geometry.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';
import 'package:dart_mapbox_search/src/models/geocoding/mapbox_search_geocoding_feature_properties.dart';

// Represents a geographic feature returned in the geocoding response
class MapboxSearchGeocodingFeature {
  // The unique identifier of the feature, referred to as mapbox_id in other parts of the response
  final String mapboxId;

  // The type of GeoJSON feature, typically "Feature"
  final String type;

  // Geometry describing the spatial location of the feature
  final MapboxSearchFeatureGeometry geometry;

  // Properties describing additional details of the feature
  final MapboxSearchGeocodingFeatureProperties properties;

  // Constructor for MapboxSearchGeocodingFeature
  const MapboxSearchGeocodingFeature(
      {required this.mapboxId,
      required this.type,
      required this.geometry,
      required this.properties});

  // Factory method to create MapboxSearchGeocodingFeature from JSON data
  factory MapboxSearchGeocodingFeature.fromJson(Json json) {
    return MapboxSearchGeocodingFeature(
        mapboxId: json['id'] as String, // Parses the feature id from JSON
        type:
            json['type'] as String, // Parses the GeoJSON feature type from JSON
        geometry: MapboxSearchFeatureGeometry.fromJson(
            json['geometry'] as Json), // Parses geometry from JSON
        properties: MapboxSearchGeocodingFeatureProperties.fromJson(
            json['properties'] as Json) // Parses properties from JSON
        );
  }
}
