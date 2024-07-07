/// Enum representing all supported navigation profiles
enum MapboxSearchNavigationProfile {
  /// driving
  driving('driving'),

  /// walking
  walking('walking'),

  /// cycling
  cycling('cycling');

  /// The queryParameter value
  final String queryParameter;

  /// Constructor of MapboxSearchNavigationProfile
  const MapboxSearchNavigationProfile(this.queryParameter);
}
