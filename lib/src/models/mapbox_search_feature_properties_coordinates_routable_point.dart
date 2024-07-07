import 'package:dart_mapbox_search/src/models/mapbox_search_point.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

// Represents a routable point related to Mapbox search feature coordinates
class MapboxSearchFeaturePropertiesCoordinatesRoutablePoint {
  // The name or identifier of the routable point
  final String name;

  // The geographic point of the routable point
  final MapboxSearchPoint point;

  // Optional note related to the routable point
  final String? note;

  // Constructor for MapboxSearchFeaturePropertiesCoordinatesRoutablePoint
  const MapboxSearchFeaturePropertiesCoordinatesRoutablePoint(
      {required this.name, required this.point, this.note});

  // Factory method to create MapboxSearchFeaturePropertiesCoordinatesRoutablePoint from JSON data
  factory MapboxSearchFeaturePropertiesCoordinatesRoutablePoint.fromJson(
      Json json) {
    return MapboxSearchFeaturePropertiesCoordinatesRoutablePoint(
        name: json['name'] as String, // Parses the name from JSON
        point: MapboxSearchPoint.fromJson(json), // Parses the point from JSON
        note: json['note'] as String? // Parses the note if available
        );
  }
}
