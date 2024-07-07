/// Enum representing all supported response formats
enum MapboxSearchGeocodingResponseFormat {
  /// GeoJSON
  geojson('geojson'),

  /// Mapbox Geocoding v5 API
  v5('v5');

  /// The queryParameter value
  final String queryParameter;

  /// Constructor of MapboxSearchGeocodingResponseFormat
  const MapboxSearchGeocodingResponseFormat(this.queryParameter);

  /// Method for returning a response format based on a provided value
  static MapboxSearchGeocodingResponseFormat fromString(String value) {
    return MapboxSearchGeocodingResponseFormat.values
        .firstWhere((t) => t.queryParameter == value);
  }
}
