// Represents different types of proximity for Mapbox search
import 'package:dart_mapbox_search/src/models/mapbox_search_point.dart';

// Sealed class defining different types of proximity
sealed class MapboxSearchProximity {
  // Factory method to create an IP proximity instance
  factory MapboxSearchProximity.ip() => const MapboxSearchIpProximity();

  // Factory method to create a point proximity instance with a specified point
  factory MapboxSearchProximity.point(MapboxSearchPoint point) =>
      MapboxSearchPointProximity(point);

  // Abstract method to convert the proximity to a query parameter
  String toQueryParameter();
}

// Represents proximity by IP address
class MapboxSearchIpProximity implements MapboxSearchProximity {
  // Const constructor for MapboxSearchIpProximity
  const MapboxSearchIpProximity();

  @override
  String toQueryParameter() {
    return 'ip';
  }
}

// Represents proximity by a specific geographic point
class MapboxSearchPointProximity implements MapboxSearchProximity {
  // The geographic point for proximity
  final MapboxSearchPoint point;

  // Constructor for MapboxSearchPointProximity
  const MapboxSearchPointProximity(this.point);

  @override
  String toQueryParameter() {
    return point.toQueryParameter();
  }
}
