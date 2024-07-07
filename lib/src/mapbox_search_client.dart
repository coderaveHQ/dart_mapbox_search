import 'package:dart_mapbox_search/src/mapbox_search_geocoding_client.dart';
import 'package:dart_mapbox_search/src/mapbox_search_search_client.dart';

/// A class holding the clients for the Mapbox Search Box and Geocoding API
class MapboxSearchClient {
  /// Client for search-related functionalities
  late final MapboxSearchSearchClient search;

  /// Client for geocoding functionalities
  late final MapboxSearchGeocodingClient geocoding;

  /// Constructor to initialize the clients with the access token
  MapboxSearchClient({required String accessToken}) {
    search = _initMapboxSearchSearchClient(accessToken: accessToken);
    geocoding = _initMapboxSearchGeocoding(accessToken: accessToken);
  }

  /// Initialize the search client
  MapboxSearchSearchClient _initMapboxSearchSearchClient(
      {required String accessToken}) {
    return MapboxSearchSearchClient(accessToken: accessToken);
  }

  /// Initialize the geocoding client
  MapboxSearchGeocodingClient _initMapboxSearchGeocoding(
      {required String accessToken}) {
    return MapboxSearchGeocodingClient(accessToken: accessToken);
  }
}
