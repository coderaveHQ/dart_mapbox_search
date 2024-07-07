// A class representing a geographic point with longitude and latitude
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

class MapboxSearchPoint {
  // The longitude coordinate of the point
  final double longitude;

  // The latitude coordinate of the point
  final double latitude;

  // Constructor for creating a MapboxSearchPoint instance
  const MapboxSearchPoint({required this.longitude, required this.latitude});

  // Factory method to create a MapboxSearchPoint instance from JSON
  factory MapboxSearchPoint.fromJson(Json json) {
    return MapboxSearchPoint(
      longitude: json['longitude'] as double,
      latitude: json['latitude'] as double,
    );
  }

  // Factory method to create a MapboxSearchPoint instance from a list of coordinates
  factory MapboxSearchPoint.fromList(List<double> list) {
    return MapboxSearchPoint(
      longitude: list[0],
      latitude: list[1],
    );
  }

  // Method to convert the point to a query parameter format
  String toQueryParameter() {
    return '$longitude,$latitude';
  }
}
