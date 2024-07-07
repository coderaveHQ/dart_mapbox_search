import 'package:dart_mapbox_search/src/mapbox_search_client.dart';

// A class for holding the client that separates the clients for the Mapbox Search Box and Geocoding API
class MapboxSearch {
  // Singleton instance of MapboxSearch
  static MapboxSearch get instance {
    // Ensure the instance is initialized before returning it
    assert(_instance._initialized,
        'You must initialize the MapboxSearch instance before calling MapboxSearch.instance.');
    return _instance;
  }

  // Initialize the MapboxSearch instance with the access token
  static MapboxSearch initialize({required String accessToken}) {
    // Ensure the instance is not already initialized
    assert(!_instance._initialized, 'This instance is already initialized.');
    // Initialize the instance with the provided access token
    _instance._init(accessToken: accessToken);

    return _instance;
  }

  // Private constructor to prevent direct instantiation
  MapboxSearch._();

  // Static singleton instance
  static final MapboxSearch _instance = MapboxSearch._();

  // Flag to indicate if the instance has been initialized
  bool _initialized = false;

  // Client for interacting with Mapbox APIs
  late MapboxSearchClient client;

  // Dispose the instance, resetting the initialization flag
  void dispose() {
    _initialized = false;
  }

  // Initialize the client with the access token
  void _init({required String accessToken}) {
    client = MapboxSearchClient(accessToken: accessToken);

    _initialized = true;
  }
}
