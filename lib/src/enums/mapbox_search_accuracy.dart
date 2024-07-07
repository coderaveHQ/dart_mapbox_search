/// Enum representing the result accuracy
///
/// Point accuracy for address features
/// -----------------------------------
/// - rooftop: Result intersects a known building/entrance.
/// - parcel:	Result is associated with one or more address within a specified polygonal boundary.
/// - point: Result is a known address point but does not intersect a known rooftop/parcel.
/// - interpolated:	Result position and existence are estimated based on nearby known addresses.
/// - approximate: Result position is approximated by a 9-digit zipcode centroid.
enum MapboxSearchAccuracy {
  /// Result intersects a known building/entrance.
  rooftop('rooftop'),

  /// Result is associated with one or more address within a specified polygonal boundary.
  parcel('parcel'),

  /// Result is a known address point but does not intersect a known rooftop/parcel.
  point('point'),

  /// Result position and existence are estimated based on nearby known addresses.
  interpolated('interpolated'),

  /// intersection
  intersection('intersection'),

  /// Result position is approximated by a 9-digit zipcode centroid.
  approximate('approximate'),

  /// street
  street('street');

  /// The queryParameter value
  final String queryParameter;

  /// Constructor of MapboxSearchAccuracy
  const MapboxSearchAccuracy(this.queryParameter);

  /// Method for returning a Maki icon based on a provided value
  static MapboxSearchAccuracy fromString(String value) {
    return MapboxSearchAccuracy.values
        .firstWhere((t) => t.queryParameter == value);
  }
}
