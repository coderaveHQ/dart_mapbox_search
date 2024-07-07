import 'package:dart_mapbox_search/src/enums/mapbox_search_feature_type.dart';
import 'package:dart_mapbox_search/src/extensions/generic_extension.dart';
import 'package:dart_mapbox_search/src/models/geocoding/mapbox_search_geocoding_match.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_box.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_feature_properties_coordinates.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// Represents the properties of a geographic feature returned by Mapbox Geocoding API
class MapboxSearchGeocodingFeatureProperties {
  /// The unique identifier of the feature, referred to as mapbox_id in other parts of the response
  final String? mapboxId;

  /// The type of the feature, such as country, region, postcode, etc.
  final MapboxSearchFeatureType? featureType;

  /// The formatted name of the feature
  final String? name;

  /// The preferred name of the feature
  final String? namePreffered;

  /// Formatted string of result context: place, region, country, postcode.
  final String? placeFormatted;

  /// Full formatted string of the feature, combining name_preferred and place_formatted.
  final String? fullAddress;

  /// Represents the hierarchy of encompassing parent features
  final MapboxSearchContext? context;

  /// Geographical position and accuracy of the feature, including routable points
  final MapboxSearchFeaturePropertiesCoordinates? coordinates;

  /// The bounding box of the feature
  final MapboxSearchBox? bbox;

  /// Additional metadata indicating how the result components match to the input query
  final MapboxSearchGeocodingMatch? matchCode;

  /// Constructor for MapboxSearchGeocodingFeatureProperties
  const MapboxSearchGeocodingFeatureProperties(
      {this.mapboxId,
      this.featureType,
      this.name,
      this.namePreffered,
      this.placeFormatted,
      this.fullAddress,
      this.context,
      this.coordinates,
      this.bbox,
      this.matchCode});

  /// Factory method to create MapboxSearchGeocodingFeatureProperties from JSON data
  factory MapboxSearchGeocodingFeatureProperties.fromJson(Json json) {
    return MapboxSearchGeocodingFeatureProperties(
        mapboxId: json['id'] as String?,
        featureType: (json['feature_type'] as String?)
            .whenNotNull<MapboxSearchFeatureType>(
                (t) => MapboxSearchFeatureType.fromString(t)),
        name: json['name'] as String?,
        namePreffered: json['name_preferred'] as String?,
        placeFormatted: json['place_formatted'] as String?,
        fullAddress: json['full_address'] as String?,
        context: (json['context'] as Json?)
            .whenNotNull((j) => MapboxSearchContext.fromJson(j)),
        coordinates: (json['coordinates'] as Json?)
            .whenNotNull<MapboxSearchFeaturePropertiesCoordinates>(
                (j) => MapboxSearchFeaturePropertiesCoordinates.fromJson(j)),
        bbox: (json['bbox'] as List<dynamic>?).whenNotNull<MapboxSearchBox>(
            (l) => MapboxSearchBox.fromList(List<double>.from(l))),
        matchCode: (json['match_code'] as Json?)
            .whenNotNull<MapboxSearchGeocodingMatch>(
                (j) => MapboxSearchGeocodingMatch.fromJson(j)));
  }
}
