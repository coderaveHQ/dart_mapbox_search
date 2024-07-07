/// Enum representing all supported confidence scores
/// - exact: No components are unmatched (up to 2 may be inferred) and no there are no extraneous query tokens.
/// - high: One component (excluding house_number or region) may have been corrected. Additionally, if only house_number, street, and postcode are provided and match, high confidence is returned.
/// - medium: Two components (excluding house_number or region) may have changed. Allows for minor misspellings. If house_number, street, place, and postcode are matched the region may be corrected.
/// - low: house_number, region, or more than 2 other components have been corrected.
enum MapboxSearchGeocodingConfidence {
  exact('exact'),
  high('high'),
  medium('medium'),
  low('low');

  final String id;

  const MapboxSearchGeocodingConfidence(this.id);

  // Method for returning a confidence score based on a provided value
  static MapboxSearchGeocodingConfidence fromId(String id) {
    return MapboxSearchGeocodingConfidence.values.firstWhere((c) => c.id == id);
  }
}
