/// Enum representing all supported match codes
///
/// Smart Address Match
/// -------------------
/// The match_code object in the Geocoding API helps you understand how the resulting address feature aligns with the query submitted. Available only for address-type features, the match_code provides a breakdown of how each element of the result matches with the query, plus a confidence score, based on how well it matches. This can help you make decisions about what results to keep or throw out based on your application's tolerance for fuzzy matching on the query.
/// Smart Address Match is available for all forward geocoding requests that return an address type feature. It works best when using Structured Input forward queries, as the request components must be typed explicitly.
///
/// - matched: The component value matches the user's input.
/// - unmatched: The component value doesn't match the user's input, or the user didn't submit this component type as part of the query.
/// - not_applicable: The component is not used in the postal address string for example locality.
/// - inferred: The component type wasn't submitted as part of the query, but we were able to confidently fill in the value. only returned for the country component.
/// - plausible: Only relevant for the address_number and secondary_address components. In the case of address_number, this means the address accuracy is interpolated. In the case of secondary_address, this means the secondary address was extrapolated, i.e. the primary address is known to have secondary addresses, but the geocoding service did not find a specific matching secondary address in our data.
enum MapboxSearchGeocodingMatchCode {
  /// The component value matches the user's input.
  matched('matched'),

  /// The component value doesn't match the user's input, or the user didn't submit this component type as part of the query.
  unmatched('unmatched'),

  /// The component is not used in the postal address string for example locality.
  notApplicable('not_applicable'),

  /// The component type wasn't submitted as part of the query, but we were able to confidently fill in the value. only returned for the country component.
  inferred('inferred'),

  /// Only relevant for the address_number and secondary_address components. In the case of address_number, this means the address accuracy is interpolated. In the case of secondary_address, this means the secondary address was extrapolated, i.e. the primary address is known to have secondary addresses, but the geocoding service did not find a specific matching secondary address in our data.
  plausible('plausible');

  /// The id value
  final String id;

  /// Constructor of MapboxSearchGeocodingMatchCode
  const MapboxSearchGeocodingMatchCode(this.id);

  /// Method for returning a match code based on a provided value
  static MapboxSearchGeocodingMatchCode fromId(String id) {
    return MapboxSearchGeocodingMatchCode.values.firstWhere((m) => m.id == id);
  }
}
