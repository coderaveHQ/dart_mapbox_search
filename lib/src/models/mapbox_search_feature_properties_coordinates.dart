import 'package:dart_mapbox_search/src/extensions/generic_extension.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_accuracy.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_point.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_feature_properties_coordinates_routable_point.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// Represents coordinates of a Mapbox search feature
class MapboxSearchFeaturePropertiesCoordinates {
  /// The main geographic point of the feature
  final MapboxSearchPoint point;

  /// Accuracy information related to the point
  final MapboxSearchAccuracy? accuracy;

  /// List of routable points related to the feature's coordinates
  final List<MapboxSearchFeaturePropertiesCoordinatesRoutablePoint>?
      routablePoints;

  /// Constructor for MapboxSearchFeaturePropertiesCoordinates
  const MapboxSearchFeaturePropertiesCoordinates(
      {required this.point, this.accuracy, this.routablePoints});

  /// Factory method to create MapboxSearchFeaturePropertiesCoordinates from JSON data
  factory MapboxSearchFeaturePropertiesCoordinates.fromJson(Json json) {
    return MapboxSearchFeaturePropertiesCoordinates(
        point:
            MapboxSearchPoint.fromJson(json), // Parses the main point from JSON
        accuracy: (json['accuracy'] as String?)?.whenNotNull<MapboxSearchAccuracy>(
            (a) => MapboxSearchAccuracy.fromString(
                a)), // Parses accuracy if available
        routablePoints: (json['routable_points'] as List<dynamic>?)?.whenNotNull<
                List<MapboxSearchFeaturePropertiesCoordinatesRoutablePoint>>(
            (r) => List<Json>.from(r)
                .map((j) =>
                    MapboxSearchFeaturePropertiesCoordinatesRoutablePoint.fromJson(j))
                .toList()) // Parses routable points if available
        );
  }
}
