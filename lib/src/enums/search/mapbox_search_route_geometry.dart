// Enum representing all supported route geometries
enum MapboxSearchRouteGeometry {
  polyline('polyline'),
  polyline6('polyline6');

  final String queryParameter;

  const MapboxSearchRouteGeometry(this.queryParameter);
}
