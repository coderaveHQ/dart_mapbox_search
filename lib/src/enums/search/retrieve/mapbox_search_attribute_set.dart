// Enum representing all supported attribute sets
enum MapboxSearchAttributeSet {
  basic('basic'),
  photos('photos'),
  venue('venue'),
  visit('visit');

  final String queryParameter;

  const MapboxSearchAttributeSet(this.queryParameter);
}
