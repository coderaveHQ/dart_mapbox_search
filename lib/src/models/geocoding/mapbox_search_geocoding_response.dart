import 'package:dart_mapbox_search/src/utils/typdefs.dart';
import 'package:dart_mapbox_search/src/models/geocoding/mapbox_search_geocoding_feature.dart';

// Represents a response object containing geocoding results
class MapboxSearchGeocodingResponse {
  // The type of GeoJSON object, usually "FeatureCollection"
  final String type;

  // List of geocoding features returned in the response
  final List<MapboxSearchGeocodingFeature> features;

  // Attribution string attributing the results to Mapbox
  final String attribution;

  // Constructor for MapboxSearchGeocodingResponse
  const MapboxSearchGeocodingResponse(
      {required this.type, required this.features, required this.attribution});

  // Factory method to create MapboxSearchGeocodingResponse from JSON data
  factory MapboxSearchGeocodingResponse.fromJson(Json json) {
    return MapboxSearchGeocodingResponse(
        type: json['type'] as String, // Parses the type from JSON
        features: List<Json>.from(json['features'])
            .map<MapboxSearchGeocodingFeature>(
                (j) => MapboxSearchGeocodingFeature.fromJson(j))
            .toList(), // Parses features from JSON
        attribution:
            json['attribution'] as String // Parses attribution from JSON
        );
  }
}
