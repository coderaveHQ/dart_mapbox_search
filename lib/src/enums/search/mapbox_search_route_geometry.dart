/// Enum representing all supported route geometries
enum MapboxSearchRouteGeometry {
  /// polyline5
  polyline('polyline'),

  /// polyline6
  polyline6('polyline6');

  /// The queryParameter value
  final String queryParameter;

  /// Constructor of MapboxSearchRouteGeometry
  const MapboxSearchRouteGeometry(this.queryParameter);
}
