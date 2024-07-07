/// Enum representing all supported response formats
enum MapboxSearchGeocodingResponseFormat {
  geojson('geojson'),
  v5('v5');

  final String queryParameter;

  const MapboxSearchGeocodingResponseFormat(this.queryParameter);

  // Method for returning a response format based on a provided value
  static MapboxSearchGeocodingResponseFormat fromString(String value) {
    return MapboxSearchGeocodingResponseFormat.values
        .firstWhere((t) => t.queryParameter == value);
  }
}
