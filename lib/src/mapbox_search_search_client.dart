import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'package:dart_mapbox_search/src/extensions/list_extension.dart';
import 'package:dart_mapbox_search/src/enums/search/retrieve/mapbox_search_attribute_set.dart';
import 'package:dart_mapbox_search/src/models/search/mapbox_search_search_response.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_feature_type.dart';
import 'package:dart_mapbox_search/src/models/search/suggest/mapbox_search_suggest_response.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';
import 'package:dart_mapbox_search/src/models/search/list_categories/mapbox_search_list_categories_response.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_language.dart';
import 'package:dart_mapbox_search/src/utils/mapbox_search_result.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_navigation_profile.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_poi_category.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_box.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_point.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_proximity.dart';
import 'package:dart_mapbox_search/src/models/search/mapbox_search_route.dart';

/// The Mapbox Search Box API is the easiest way to add interactive location search to connected cars, micro-mobility services, delivery apps, and more. Search Box API supports interactive location search or stand-alone queries to search addresses, places, and points of interest.
///
/// Interactive Search
/// ------------------
/// With the Search Box API, developers can create an autocomplete search experience that makes it easier for users to find not only addresses, but also points of interest (POIs), categories of POIs, street names, neighborhoods, localities, place names, districts, postcodes, regions, and countries.
/// The /suggest endpoint is used in combination with the /retrieve endpoint to create an interactive search experience for end users. Within your application, send user search queries to the /suggest endpoint to get suggested results for the given search query.
/// When a user selects a result on the application UI, you should trigger a /retrieve request to get detailed information about the selection.

// The client for the Mapbox Search Box API
class MapboxSearchSearchClient {
  // Access token for API authentication
  final String _accessToken;

  // Base URI for the Search API
  final Uri _baseUri = Uri.parse('https://api.mapbox.com/search/searchbox/v1/');

  // Constructor to initialize the client with the access token
  MapboxSearchSearchClient({
    required String accessToken,
  }) : _accessToken = accessToken;

  /// The /suggest endpoint is used in combination with the /retrieve endpoint to create an interactive search experience for end users. Within your application, send user search queries to the /suggest endpoint to get suggested results for the given search query.
  /// When a user selects a result on the application UI, you should trigger a /retrieve request to get detailed information about the selection.
  ///
  /// GET https://api.mapbox.com/search/searchbox/v1/suggest?q={search_text}
  ///
  /// This endpoint provides a list of suggested search results for the user query. This endpoint, along with the /retrieve endpoint, can be used to add autocomplete search functionality to your applications.
  Future<MapboxSearchResult<MapboxSearchSuggestResponse>> suggest(
      // The user's query string. The query is limited to 256 characters.
      String q,
      {
      // A customer-provided session token value, which groups a series of requests together for billing purposes. UUIDv4 is recommended.
      String? sessionToken,
      // The language to be returned. If not provided, the default is English.
      MapboxSearchLanguage? language,
      // The number of results to return, up to 10.
      int? limit,
      // Bias the response to favor results that are closer to a specific location. Provide either MapboxSearchIpProximity() to get results closest to the user's IP location or provide MapboxSearchPointProximity() with values for longitude and latitude. If not provided, the default is IP proximity. When both proximity and origin are provided, origin is interpreted as the target of a route, while proximity indicates the current user location.
      MapboxSearchProximity? proximity,
      // The location from which to calculate distance. When both proximity and origin are provided, origin is interpreted as the target of a route, while proximity indicates the current user location. This parameter is required for distance-to-target estimates, but may incur additional latency.
      MapboxSearchPoint? origin,
      // Limit results to only those contained within the supplied bounding box. The bounding box cannot cross the 180th meridian.
      MapboxSearchBox? bbox,
      // The navigation routing profile to use. Available profiles are: driving, walking, and cycling.
      MapboxSearchNavigationProfile? navigationProfile,
      // The route to be used for searching. This parameter enables searching along a route. Both polyline5 and polyline6 precision are accepted, but must be specified using this parameter. Correct results depend on including the right route_geometry for the route provided.
      MapboxSearchRoute? route,
      // Maximum detour in estimated minutes from route.
      num? timeDeviation,
      // Used to estimate the time of arrival from the location specified in origin or proximity. This parameter, along with navigationProfile and origin / proximity, is required for ETA calculations. ETA calculations will incur additional latency.
      bool estimateTimeOfArrival = false,
      // A list of countries.
      List<String>? countries,
      // Limit results to one or more types of features. If no types are specified, all possible types may be returned. Available types are: country, region, postcode, district, place, city, locality, neighborhood, street, address, poi, and category.
      List<MapboxSearchFeatureType>? featureTypes,
      // Limit results to those that belong to one or more categories.
      List<MapboxSearchPoiCategory>? poiCategories,
      // A list of categories that limits POI results to those that are not part of the given categories.
      List<MapboxSearchPoiCategory>? poiCategoryExclusions}) async {
    // Validate query and limit parameters
    assert(q.trim().isNotEmpty && q.trim().length <= 256,
        'The query should be between 1 and 256 characters.');
    assert(limit == null || (limit > 0 && limit <= 10),
        'The limit has to be between 1 and 10.');
    assert(
        featureTypes?.onlyContainsAllowedItems(
                MapboxSearchFeatureType.searchAllowed) ??
            true,
        'At least one featureType is not allowed for this request.');

    // Generate a session token if not provided
    if (sessionToken == null || sessionToken.isEmpty)
      sessionToken = Uuid().v4();

    // Construct the request URI with query parameters
    final Uri uri = Uri(
        scheme: _baseUri.scheme,
        host: _baseUri.host,
        path: '${_baseUri.path}suggest',
        queryParameters: {
          'q': q,
          'access_token': _accessToken,
          'session_token': sessionToken,
          if (language != null) 'language': language.toQueryParameter(),
          if (limit != null) 'limit': limit,
          if (proximity != null) 'proximity': proximity.toQueryParameter(),
          if (origin != null) 'origin': origin.toQueryParameter(),
          if (bbox != null) 'bbox': bbox.toQueryParameter(),
          if (navigationProfile != null)
            'navigation_profile': navigationProfile.queryParameter,
          if (route != null) 'route': route.polyline,
          if (route != null) 'route_geometry': route.geometry.queryParameter,
          if (route != null) 'sar_type': 'isochrone',
          if (timeDeviation != null) 'time_deviation': timeDeviation,
          if (estimateTimeOfArrival) 'eta_type': 'navigation',
          if (countries != null && countries.isNotEmpty)
            'country': countries.join(','),
          if (featureTypes != null && featureTypes.isNotEmpty)
            'types': featureTypes.map((t) => t.queryParameter).join(','),
          if (poiCategories != null && poiCategories.isNotEmpty)
            'poi_category': poiCategories.map((p) => p.id).join(','),
          if (poiCategoryExclusions != null && poiCategoryExclusions.isNotEmpty)
            'poi_category_exclusions':
                poiCategoryExclusions.map((p) => p.id).join(',')
        });

    // Send GET request to the API
    final http.Response response = await http.get(uri);
    // Decode the response
    final Json body = json.decode(response.body);

    // Return Failure when statusCode is not OK
    if (response.statusCode != 200)
      return MapboxSearchFailure.fromCodeAndJson(response.statusCode, body);

    // Return parsed data when statusCode is OK
    final MapboxSearchSuggestResponse result =
        MapboxSearchSuggestResponse.fromJson(json.decode(response.body));
    return MapboxSearchResult<MapboxSearchSuggestResponse>.success(result);
  }

  /// The /retrieve endpoint provides detailed information about a feature including geographic coordinates. In a search session, this endpoint is called when the user selects an item from the suggested results provided by /suggest endpoint.
  ///
  /// GET https://api.mapbox.com/search/searchbox/v1/retrieve/{id}
  ///
  /// After a successful call to the /suggest endpoint, you will use the ID contained in a suggestion's mapbox_id property to retrieve detailed information about the feature.
  Future<MapboxSearchResult<MapboxSearchSearchResponse>> retrieve(
      // The Mapbox ID
      String mapboxId,
      {
      // A customer-provided session token value, which groups a series of requests together for billing purposes. UUIDv4 is recommended.
      String? sessionToken,
      // The language to be returned. If not provided, the default is English.
      MapboxSearchLanguage? language,
      // A list of attribute sets which describe the level of metadata that will be returned. Valid options are basic, photos, venue, visit.
      List<MapboxSearchAttributeSet>? attributeSets}) async {
    // Validate query and limit parameters
    assert(mapboxId.trim().isNotEmpty, 'The mapboxId should not be empty.');

    // Generate a session token if not provided
    if (sessionToken == null || sessionToken.isEmpty)
      sessionToken = Uuid().v4();

    // Construct the request URI with query parameters
    final Uri uri = Uri(
        scheme: _baseUri.scheme,
        host: _baseUri.host,
        path: '${_baseUri.path}retrieve/$mapboxId',
        queryParameters: {
          'access_token': _accessToken,
          'session_token': sessionToken,
          if (language != null) 'language': language.toQueryParameter(),
          if (attributeSets != null && attributeSets.isNotEmpty)
            'attribute_sets':
                attributeSets.map((a) => a.queryParameter).join(',')
        });

    // Send GET request to the API
    final http.Response response = await http.get(uri);
    // Decode the response
    final Json body = json.decode(response.body);

    // Return Failure when statusCode is not OK
    if (response.statusCode != 200)
      return MapboxSearchFailure.fromCodeAndJson(response.statusCode, body);

    // Return parsed data when statusCode is OK
    final MapboxSearchSearchResponse result =
        MapboxSearchSearchResponse.fromJson(json.decode(response.body));
    return MapboxSearchResult<MapboxSearchSearchResponse>.success(result);
  }

  /// Search Box API enables developers to send one-off search requests and get relevant results. Developers can create search requests with the /forward endpoint and get a list of search results with coordinates and metadata. In contrast to Interactive Search, the /forward endpoint will not provide type-ahead suggestions, e.g., brand and category suggestions, but will only provide relevant search results.
  ///
  /// GET https://api.mapbox.com/search/searchbox/v1/forward?q={search_text}
  Future<MapboxSearchResult<MapboxSearchSearchResponse>> forward(
      // The user's query string. The query string is limited to 256 characters.
      String q,
      {
      // The language to be returned. If not provided, the default is English.
      MapboxSearchLanguage? language,
      // The number of results to return, up to 10.
      int? limit,
      // Bias the response to favor results that are closer to a specific location. Provide either MapboxSearchIpProximity() to get results closest to the user's IP location or provide MapboxSearchPointProximity() with values for longitude and latitude. If not provided, the default is IP proximity. When both proximity and origin are provided, origin is interpreted as the target of a route, while proximity indicates the current user location.
      MapboxSearchProximity? proximity,
      // The location from which to calculate distance. When both proximity and origin are provided, origin is interpreted as the target of a route, while proximity indicates the current user location. This parameter is required for distance-to-target estimates, but may incur additional latency.
      MapboxSearchPoint? origin,
      // Limit results to only those contained within the supplied bounding box. The bounding box cannot cross the 180th meridian.
      MapboxSearchBox? bbox,
      // The navigation routing profile to use. Available profiles are: driving, walking, and cycling.
      MapboxSearchNavigationProfile? navigationProfile,
      // Used to estimate the time of arrival from the location specified in origin or proximity. This parameter, along with navigationProfile and origin / proximity, is required for ETA calculations. ETA calculations will incur additional latency.
      bool estimateTimeOfArrival = false,
      // A list of countries.
      List<String>? countries,
      // Limit results to one or more types of features. If no types are specified, all possible types may be returned. Available types are: country, region, postcode, district, place, city, locality, neighborhood, street, address, poi, and category.
      List<MapboxSearchFeatureType>? featureTypes,
      // Limit results to those that belong to one or more categories.
      List<MapboxSearchPoiCategory>? poiCategories,
      // A list of categories that limits POI results to those that are not part of the given categories.
      List<MapboxSearchPoiCategory>? poiCategoryExclusions}) async {
    // Validate query and limit parameters
    assert(q.trim().isNotEmpty && q.trim().length <= 256,
        'The query should be between 1 and 256 characters.');
    assert(limit == null || (limit > 0 && limit <= 10),
        'The limit has to be between 1 and 10.');
    assert(
        featureTypes?.onlyContainsAllowedItems(
                MapboxSearchFeatureType.searchAllowed) ??
            true,
        'At least one featureType is not allowed for this request.');

    // Construct the request URI with query parameters
    final Uri uri = Uri(
        scheme: _baseUri.scheme,
        host: _baseUri.host,
        path: '${_baseUri.path}forward',
        queryParameters: {
          'q': q,
          'access_token': _accessToken,
          if (language != null) 'language': language.toQueryParameter(),
          if (limit != null) 'limit': limit,
          if (proximity != null) 'proximity': proximity.toQueryParameter(),
          if (origin != null) 'origin': origin.toQueryParameter(),
          if (bbox != null) 'bbox': bbox.toQueryParameter(),
          if (navigationProfile != null)
            'navigation_profile': navigationProfile.queryParameter,
          if (estimateTimeOfArrival) 'eta_type': 'navigation',
          if (countries != null && countries.isNotEmpty)
            'country': countries.join(','),
          if (featureTypes != null && featureTypes.isNotEmpty)
            'types': featureTypes.map((t) => t.queryParameter).join(','),
          if (poiCategories != null && poiCategories.isNotEmpty)
            'poi_category': poiCategories.map((p) => p.id).join(','),
          if (poiCategoryExclusions != null && poiCategoryExclusions.isNotEmpty)
            'poi_category_exclusions':
                poiCategoryExclusions.map((p) => p.id).join(',')
        });

    // Send GET request to the API
    final http.Response response = await http.get(uri);
    // Decode the response
    final Json body = json.decode(response.body);

    // Return Failure when statusCode is not OK
    if (response.statusCode != 200)
      return MapboxSearchFailure.fromCodeAndJson(response.statusCode, body);

    // Return parsed data when statusCode is OK
    final MapboxSearchSearchResponse result =
        MapboxSearchSearchResponse.fromJson(json.decode(response.body));
    return MapboxSearchResult<MapboxSearchSearchResponse>.success(result);
  }

  /// Category Search makes it possible to browse entire categories of results, like coffee shops, hotels, and bookstores around a specific location or along a route.
  /// The /category endpoint provides a list of POIs for a given location. In a search use case, this endpoint is used to create hot-buttons to execute search for a specific category, for example a coffee button that surfaces all nearby coffee shops.
  ///
  /// GET https://api.mapbox.com/search/searchbox/v1/category/{canonical_category_id}
  ///
  /// Use the Category Search endpoint if you want to query points of interest (POIs) results filtered by a category at a specific location or along a route. The endpoint will only return POIs with the specified category.
  Future<MapboxSearchResult<MapboxSearchSearchResponse>> category(
      // The category to search for
      MapboxSearchPoiCategory category,
      {
      // The language to be returned. If not provided, the default is English.
      MapboxSearchLanguage? language,
      // The number of results to return, up to 25.
      int? limit,
      // Bias the response to favor results that are closer to a specific location. Provide either MapboxSearchIpProximity() to get results closest to the user's IP location or provide MapboxSearchPointProximity() with values for longitude and latitude. If not provided, the default is IP proximity. When both proximity and origin are provided, origin is interpreted as the target of a route, while proximity indicates the current user location.
      MapboxSearchProximity? proximity,
      // The location from which to calculate distance. When both proximity and origin are provided, origin is interpreted as the target of a route, while proximity indicates the current user location. This parameter is required for distance-to-target estimates, but may incur additional latency.
      MapboxSearchPoint? origin,
      // Limit results to only those contained within the supplied bounding box. The bounding box cannot cross the 180th meridian.
      MapboxSearchBox? bbox,
      // The navigation routing profile to use. Available profiles are: driving, walking, and cycling.
      MapboxSearchNavigationProfile? navigationProfile,
      // The route to be used for searching. This parameter enables searching along a route. Both polyline5 and polyline6 precision are accepted, but must be specified using this parameter. Correct results depend on including the right route_geometry for the route provided.
      MapboxSearchRoute? route,
      // Maximum detour in estimated minutes from route.
      num? timeDeviation,
      // Used to estimate the time of arrival from the location specified in origin or proximity. This parameter, along with navigationProfile and origin / proximity, is required for ETA calculations. ETA calculations will incur additional latency.
      bool estimateTimeOfArrival = false,
      // A list of countries.
      List<String>? countries,
      // Limit results to one or more types of features. If no types are specified, all possible types may be returned. Available types are: country, region, postcode, district, place, city, locality, neighborhood, street, address, poi, and category.
      List<MapboxSearchFeatureType>? featureTypes,
      // A list of categories that limits POI results to those that are not part of the given categories.
      List<MapboxSearchPoiCategory>? poiCategoryExclusions}) async {
    // Validate query and limit parameters
    assert(limit == null || (limit > 0 && limit <= 25),
        'The limit has to be between 1 and 25.');
    assert(
        featureTypes?.onlyContainsAllowedItems(
                MapboxSearchFeatureType.searchAllowed) ??
            true,
        'At least one featureType is not allowed for this request.');

    // Construct the request URI with query parameters
    final Uri uri = Uri(
        scheme: _baseUri.scheme,
        host: _baseUri.host,
        path: '${_baseUri.path}category/${category.id}',
        queryParameters: {
          'access_token': _accessToken,
          if (language != null) 'language': language.toQueryParameter(),
          if (limit != null) 'limit': limit,
          if (proximity != null) 'proximity': proximity.toQueryParameter(),
          if (origin != null) 'origin': origin.toQueryParameter(),
          if (bbox != null) 'bbox': bbox.toQueryParameter(),
          if (navigationProfile != null)
            'navigation_profile': navigationProfile.queryParameter,
          if (route != null) 'route': route.polyline,
          if (route != null) 'route_geometry': route.geometry.queryParameter,
          if (route != null) 'sar_type': 'isochrone',
          if (timeDeviation != null) 'time_deviation': timeDeviation,
          if (estimateTimeOfArrival) 'eta_type': 'navigation',
          if (countries != null && countries.isNotEmpty)
            'country': countries.join(','),
          if (featureTypes != null && featureTypes.isNotEmpty)
            'types': featureTypes.map((t) => t.queryParameter).join(','),
          if (poiCategoryExclusions != null && poiCategoryExclusions.isNotEmpty)
            'poi_category_exclusions':
                poiCategoryExclusions.map((p) => p.id).join(',')
        });

    // Send GET request to the API
    final http.Response response = await http.get(uri);
    // Decode the response
    final Json body = json.decode(response.body);

    // Return Failure when statusCode is not OK
    if (response.statusCode != 200)
      return MapboxSearchFailure.fromCodeAndJson(response.statusCode, body);

    // Return parsed data when statusCode is OK
    final MapboxSearchSearchResponse result =
        MapboxSearchSearchResponse.fromJson(json.decode(response.body));
    return MapboxSearchResult<MapboxSearchSearchResponse>.success(result);
  }

  /// The request to the /list/category endpoint will return a list of all the available categories with their canonical ID and name in the language you specified. This endpoint does not describe parent/child relationships and cannot be used to infer relationships between categories.
  ///
  /// GET https://api.mapbox.com/search/searchbox/v1/list/category
  Future<MapboxSearchResult<MapboxSearchListCategoriesResponse>> listCategories(
      {
      // The language to be returned. If not provided, the default is English.
      MapboxSearchLanguage? language}) async {
    // Construct the request URI with query parameters
    final Uri uri = Uri(
        scheme: _baseUri.scheme,
        host: _baseUri.host,
        path: '${_baseUri.path}list/category',
        queryParameters: {
          'access_token': _accessToken,
          if (language != null) 'language': language.toQueryParameter()
        });

    // Send GET request to the API
    final http.Response response = await http.get(uri);
    // Decode the response
    final Json body = json.decode(response.body);

    // Return Failure when statusCode is not OK
    if (response.statusCode != 200)
      return MapboxSearchFailure.fromCodeAndJson(response.statusCode, body);

    // Return parsed data when statusCode is OK
    final MapboxSearchListCategoriesResponse result =
        MapboxSearchListCategoriesResponse.fromJson(json.decode(response.body));
    return MapboxSearchResult<MapboxSearchListCategoriesResponse>.success(
        result);
  }

  /// With Reverse lookup, you can get a list of addresses and POIs around a given coordinate (e,g, what is around 33.9416° N, 118.4085° W).
  /// The /reverse endpoint allows you to look up a single pair of coordinates and returns the geographic feature or features that exist at that location.
  ///
  /// GET https://api.mapbox.com/search/searchbox/v1/reverse?longitude={longitude}&latitude={latitude}
  Future<MapboxSearchResult<MapboxSearchSearchResponse>> reverse(
      // The longitudinal coordinate of coordinate for the reverse query.
      double longitude,
      // The latitudinal coordinate of coordinate for the reverse query.
      double latitude,
      {
      // The language to be returned. If not provided, the default is English.
      MapboxSearchLanguage? language,
      // The number of results to return, up to 10.
      int? limit,
      // A list of countries.
      List<String>? countries,
      // Limit results to one or more types of features. If no types are specified, all possible types may be returned. Available types are: country, region, prefecture, postcode, district, place, city, locality, oaza, block, street, and address.
      List<MapboxSearchFeatureType>? featureTypes}) async {
    // Validate query and limit parameters
    assert(limit == null || (limit > 0 && limit <= 10),
        'The limit has to be between 1 and 10.');
    assert(
        featureTypes?.onlyContainsAllowedItems(
                MapboxSearchFeatureType.searchReverseAllowed) ??
            true,
        'At least one featureType is not allowed for this request.');

    // Construct the request URI with query parameters
    final Uri uri = Uri(
        scheme: _baseUri.scheme,
        host: _baseUri.host,
        path: '${_baseUri.path}reverse',
        queryParameters: {
          'longitude': longitude.toString(),
          'latitude': latitude.toString(),
          'access_token': _accessToken,
          if (language != null) 'language': language.toQueryParameter(),
          if (limit != null) 'limit': limit,
          if (countries != null && countries.isNotEmpty)
            'country': countries.join(','),
          if (featureTypes != null && featureTypes.isNotEmpty)
            'types': featureTypes.map((t) => t.queryParameter).join(',')
        });

    // Send GET request to the API
    final http.Response response = await http.get(uri);
    // Decode the response
    final Json body = json.decode(response.body);

    // Return Failure when statusCode is not OK
    if (response.statusCode != 200)
      return MapboxSearchFailure.fromCodeAndJson(response.statusCode, body);

    // Return parsed data when statusCode is OK
    final MapboxSearchSearchResponse result =
        MapboxSearchSearchResponse.fromJson(json.decode(response.body));
    return MapboxSearchResult<MapboxSearchSearchResponse>.success(result);
  }
}
