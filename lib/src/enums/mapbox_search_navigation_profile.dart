// Enum representing all supported navigation profiles
enum MapboxSearchNavigationProfile {
  driving('driving'),
  walking('walking'),
  cycling('cycling');

  final String queryParameter;

  const MapboxSearchNavigationProfile(this.queryParameter);
}
