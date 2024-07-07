import 'package:dart_mapbox_search/src/models/mapbox_search_point.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// A class representing the spatial geometry of the returned feature.
class MapboxSearchFeatureGeometry {
  /// The geographical point representing the feature
  final MapboxSearchPoint point;

  /// This will always be "Point"
  final String type;

  /// Constructor for creating a MapboxSearchFeatureGeometry instance
  const MapboxSearchFeatureGeometry({required this.point, required this.type});

  /// Factory method for creating a MapboxSearchFeatureGeometry instance from a JSON object
  factory MapboxSearchFeatureGeometry.fromJson(Json json) {
    return MapboxSearchFeatureGeometry(
        point:
            MapboxSearchPoint.fromList(List<double>.from(json['coordinates'])),
        type: json['type'] as String);
  }
}
