import 'package:dart_mapbox_search/src/enums/search/mapbox_search_route_geometry.dart';

/// Represents a route with a polyline string and its geometry precision type.
class MapboxSearchRoute {
  /// A polyline encoded linestring describing the route to be used for searching. This parameter enables searching along a route. Both polyline5 and polyline6 precision are accepted, but must be specified using the geometry parameter.
  final String polyline;

  /// Passed in conjunction with a route polyline describing its precision. Options are polyline or polyline6. If this parameter is not provided with a route, the default is polyline. Correct results depend on including the right geometry for the route provided.
  final MapboxSearchRouteGeometry geometry;

  /// Constructor for MapboxSearchRoute
  const MapboxSearchRoute(
      {required this.polyline,
      this.geometry = MapboxSearchRouteGeometry.polyline});
}
