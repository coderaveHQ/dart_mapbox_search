/// Enum representing all supported attribute sets
enum MapboxSearchAttributeSet {
  /// basic
  basic('basic'),

  /// photos
  photos('photos'),

  /// venue
  venue('venue'),

  /// visit
  visit('visit');

  /// The queryParameter value
  final String queryParameter;

  /// Constructor of MapboxSearchAttributeSet
  const MapboxSearchAttributeSet(this.queryParameter);
}
