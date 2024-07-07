import 'package:dart_mapbox_search/src/models/search/mapbox_search_search_feature.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// Represents a response from the Search Box API (not /suggest & /list/category).
class MapboxSearchSearchResponse {
  /// This will always be "FeatureCollection".
  final String type;

  /// The returned feature objects.
  final List<MapboxSearchSearchFeature> features;

  /// The attribution data for results.
  final String attribution;

  /// Constructor for MapboxSearchSearchResponse
  const MapboxSearchSearchResponse(
      {required this.type, required this.features, required this.attribution});

  /// Factory method to create MapboxSearchSearchResponse from JSON data
  factory MapboxSearchSearchResponse.fromJson(Json json) {
    return MapboxSearchSearchResponse(
        type: json['type'] as String,
        features: List<Json>.from(json['features'])
            .map((json) => MapboxSearchSearchFeature.fromJson(json))
            .toList(),
        attribution: json['attribution'] as String);
  }
}
