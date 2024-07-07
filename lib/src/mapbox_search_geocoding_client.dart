import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dart_mapbox_search/src/enums/geocoding/mapbox_search_geocoding_response_format.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_country.dart';
import 'package:dart_mapbox_search/src/enums/geocoding/mapbox_search_geocoding_worldview.dart';
import 'package:dart_mapbox_search/src/models/geocoding/mapbox_search_geocoding_response.dart';
import 'package:dart_mapbox_search/src/utils/mapbox_search_result.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_feature_type.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_language.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_box.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_proximity.dart';
import 'package:dart_mapbox_search/src/extensions/list_extension.dart';

/// The Mapbox Geocoding API does two things: forward geocoding and reverse geocoding:
/// - Forward geocoding converts location text into geographic coordinates, turning 2 Lincoln Memorial Circle SW into -77.050,38.889.
/// - Reverse geocoding turns geographic coordinates into place names, turning -77.050, 38.889 into 2 Lincoln Memorial Circle SW. These location names can vary in specificity, from individual addresses to states and countries that contain the given coordinates.
///
/// Storing Geocoding Results
/// -------------------------
/// The Mapbox Geocoding API offers two types of result storage: Permanent and Temporary.
/// Temporary results are not allowed to be cached, while Permanent results are allowed to be cached and stored indefinitely.
/// Using Permanent storage with the Geocoding API requires that you have a valid credit card on file or an active enterprise contract.
/// By default, the Geocoding API will use Temporary geocoding. To use Permanent geocoding, set the optional permanent parameter to true.
///
/// The client for the Mapbox Geocoding API
class MapboxSearchGeocodingClient {
  /// Access token for API authentication
  final String _accessToken;

  /// Base URI for the Geocoding API
  final Uri _baseUri = Uri.parse('https://api.mapbox.com/search/geocode/v6/');

  /// Constructor of MapboxSearchGeocodingClient
  MapboxSearchGeocodingClient({
    required String accessToken,
  }) : _accessToken = accessToken;

  /// GET https://api.mapbox.com/search/geocode/v6/forward?q={search_text}
  ///
  /// The forward geocoding query type allows you to look up a location using a string of search text and returns its standardized address, geographic context, and coordinates.
  ///
  /// Querying for Secondary Addresses
  /// --------------------------------
  /// If no types parameter is set, or the "secondary_address" type is included in the types filter, searching for secondary addresses will be enabled. - Secondary address queries are detected after a "designator" token (e.g. "Apt", "Suite", "Unit", "#") is followed by an identifier token (e.g. "12B", "A", "103"). - If a parent address is known to have secondary addresses, we will first return known units within our data matching the provided identifier. If the identifier is not known in our data, the unit will be "extrapolated", i.e. returned as typed with the same coordinate as the parent address.
  Future<MapboxSearchResult<MapboxSearchGeocodingResponse>> forwardText(

      /// The feature you’re trying to look up. This could be an address, a city name, etc. The search text should be expressed as a URL-encoded UTF-8 string, and must not contain the semicolon character (either raw or URL-encoded). Your search text, once decoded, must consist of at most 20 words and numbers separated by spacing and punctuation, and at most 256 characters.
      /// The accuracy of coordinates returned by a forward geocoding request can be affected by how the addresses in the query are formatted.
      String q,
      {
      /// Specify whether you intend to store the results of the query (true) or not (false, default).
      bool? permanent,

      /// Specify whether to return autocomplete results (true, default) or not (false). When autocomplete is enabled, results will be included that start with the requested string, rather than responses that match it exactly. For example, a query for India might return both India and Indiana with autocomplete enabled, but only India if it’s disabled.
      /// When autocomplete is enabled, each user keystroke counts as one request to the Geocoding API. For example, a search for "Cali" would be reflected as four separate Geocoding API requests. To reduce the total requests sent, you can configure your application to only call the Geocoding API after a specific number of characters are typed.
      bool? autocomplete,

      /// Limit results to only those contained within the supplied bounding box. The bounding box cannot cross the 180th meridian.
      MapboxSearchBox? bbox,

      /// A list of countries.
      List<MapboxSearchCountry>? countries,

      /// Specify the desired response format of results (geojson, default) or for backwards compatibility (v5).
      MapboxSearchGeocodingResponseFormat? format,

      /// Set the language of the text supplied in responses. Also affects result scoring, with results matching the user’s query in the requested language being preferred over results that match in another language. For example, an autocomplete query for things that start with Frank might return Frankfurt as the first result with an English (en) language parameter, but Frankreich (“France”) with a German (de) language parameter.
      /// Options are IETF language tags comprised of a mandatory ISO 639-1 language code and, optionally, one or more IETF subtags for country or script.
      /// More than one value can also be specified, separated by commas. The first language in the list will be considered as the primary language and a response will be generated for it. For other languages, translations will be provided.
      List<MapboxSearchLanguage>? languages,

      /// Specify the maximum number of results to return. The default is 5 and the maximum supported is 10.
      int? limit,

      /// Bias the response to favor results that are closer to a specific location. Provide either MapboxSearchIpProximity() to get results closest to the user's IP location or provide MapboxSearchPointProximity() with values for longitude and latitude. If not provided, the default is IP proximity. When both proximity and origin are provided, origin is interpreted as the target of a route, while proximity indicates the current user location.
      MapboxSearchProximity? proximity,

      /// Filter results to include only a subset (one or more) of the available feature types. Options are country, region, postcode, district, place, locality, neighborhood, street, and address.
      List<MapboxSearchFeatureType>? featureTypes,

      /// Returns features that are defined differently by audiences that belong to various regional, cultural, or political groups. Available worldviews are: ar,cn,in,jp,ma,ru,tr,us. If worldview is not set, the us worldview boundaries are returned by default.
      MapboxSearchGeocodingWorldview? worldview}) async {
    // Validate query and limit parameters
    assert(q.trim().isNotEmpty && q.trim().length <= 256,
        'The query should be between 1 and 256 characters.');
    assert(limit == null || (limit > 0 && limit <= 10),
        'The limit has to be between 1 and 10.');
    assert(
        featureTypes?.onlyContainsAllowedItems(
                MapboxSearchFeatureType.geocodingAllowed) ??
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
          if (permanent != null) 'permanent': permanent,
          if (autocomplete != null) 'autocomplete': autocomplete,
          if (bbox != null) 'bbox': bbox.toQueryParameter(),
          if (countries != null && countries.isNotEmpty)
            'country': countries.map((c) => c.iso3166Alpha2).join(','),
          if (format != null) 'format': format.queryParameter,
          if (languages != null && languages.isNotEmpty)
            'language': languages.map((l) => l.toQueryParameter()).join(','),
          if (limit != null) 'limit': limit,
          if (proximity != null) 'proximity': proximity.toQueryParameter(),
          if (featureTypes != null && featureTypes.isNotEmpty)
            'types': featureTypes.map((t) => t.queryParameter).join(','),
          if (worldview != null) 'worldview': worldview.queryParameter
        });

    // Send GET request to the API
    final http.Response response = await http.get(uri);
    // Decode the response
    final Json body = json.decode(response.body);

    // Return Failure when statusCode is not OK
    if (response.statusCode != 200) {
      return MapboxSearchFailure.fromCodeAndJson(response.statusCode, body);
    }

    // Return parsed data when statusCode is OK
    final MapboxSearchGeocodingResponse result =
        MapboxSearchGeocodingResponse.fromJson(json.decode(response.body));
    return MapboxSearchResult<MapboxSearchGeocodingResponse>.success(result);
  }

  /// GET https://api.mapbox.com/search/geocode/v6/forward?address_number={address_number}&street={street}&...
  ///
  /// Structured Input is a type of forward geocoding search that allows you to define the feature type of each element of the search query by type. This can increase the accuracy of results for well-formed datasets. To use Structured Input, the q parameter is dropped in favor of separate parameters for each feature type.
  /// For best results, each element of the query must be assigned a feature type, and set autocomplete to false.
  Future<MapboxSearchResult<MapboxSearchGeocodingResponse>> forwardStructured(
      {
      /// A string including address_number and street. These values can be provided as separate parameters address_number and street listed below.
      String? addressLine1,

      /// The number associated with the house.
      String? addressNumber,

      /// The name of the street in the address.
      String? street,

      /// In some countries like Japan, the block is a component in the address.
      String? block,

      /// Typically these are cities, villages, municipalities, etc. They’re usually features used in postal addressing, and are suitable for display in ambient end-user applications where current-location context is needed (for example, in weather displays).
      String? place,

      /// Top-level sub-national administrative features, such as states in the United States or provinces in Canada or China.
      String? region,

      /// Postal codes used in country-specific national addressing systems.
      String? postcode,

      /// Official sub-city features present in countries where such an additional administrative layer is used in postal addressing, or where such features are commonly referred to in local parlance. Examples include city districts in Brazil and Chile and arrondissements in France.
      String? locality,

      /// Colloquial sub-city features often referred to in local parlance. Unlike locality features, these typically lack official status and may lack universally agreed-upon boundaries. Not available for reverse geocoding requests.
      String? neighborhood,

      /// Generally recognized countries or, in some cases like Hong Kong, an area of quasi-national administrative status that has a designated country code under ISO 3166-1.
      String? country,

      /// Specify whether you intend to store the results of the query (true) or not (false, default).
      bool? permanent,

      /// Specify whether to return autocomplete results (true, default) or not (false). When autocomplete is enabled, results will be included that start with the requested string, rather than responses that match it exactly. For example, a query for India might return both India and Indiana with autocomplete enabled, but only India if it’s disabled.
      /// When autocomplete is enabled, each user keystroke counts as one request to the Geocoding API. For example, a search for "Cali" would be reflected as four separate Geocoding API requests. To reduce the total requests sent, you can configure your application to only call the Geocoding API after a specific number of characters are typed.
      bool? autocomplete,

      /// Limit results to only those contained within the supplied bounding box. The bounding box cannot cross the 180th meridian.
      MapboxSearchBox? bbox,

      /// A list of countries.
      List<MapboxSearchCountry>? countries,

      /// Specify the desired response format of results (geojson, default) or for backwards compatibility (v5).
      MapboxSearchGeocodingResponseFormat? format,

      /// Set the language of the text supplied in responses. Also affects result scoring, with results matching the user’s query in the requested language being preferred over results that match in another language. For example, an autocomplete query for things that start with Frank might return Frankfurt as the first result with an English (en) language parameter, but Frankreich (“France”) with a German (de) language parameter.
      /// Options are IETF language tags comprised of a mandatory ISO 639-1 language code and, optionally, one or more IETF subtags for country or script.
      /// More than one value can also be specified, separated by commas. The first language in the list will be considered as the primary language and a response will be generated for it. For other languages, translations will be provided.
      List<MapboxSearchLanguage>? languages,

      /// Specify the maximum number of results to return. The default is 5 and the maximum supported is 10.
      int? limit,

      /// Bias the response to favor results that are closer to a specific location. Provide either MapboxSearchIpProximity() to get results closest to the user's IP location or provide MapboxSearchPointProximity() with values for longitude and latitude. If not provided, the default is IP proximity. When both proximity and origin are provided, origin is interpreted as the target of a route, while proximity indicates the current user location.
      MapboxSearchProximity? proximity,

      /// Filter results to include only a subset (one or more) of the available feature types. Options are country, region, postcode, district, place, locality, neighborhood, street, and address.
      List<MapboxSearchFeatureType>? featureTypes,

      /// Returns features that are defined differently by audiences that belong to various regional, cultural, or political groups. Available worldviews are: ar,cn,in,jp,ma,ru,tr,us. If worldview is not set, the us worldview boundaries are returned by default.
      MapboxSearchGeocodingWorldview? worldview}) async {
    // Validate query and limit parameters
    assert(limit == null || (limit > 0 && limit <= 10),
        'The limit has to be between 1 and 10.');
    assert(
        featureTypes?.onlyContainsAllowedItems(
                MapboxSearchFeatureType.geocodingAllowed) ??
            true,
        'At least one featureType is not allowed for this request.');

    // Construct the request URI with query parameters
    final Uri uri = Uri(
        scheme: _baseUri.scheme,
        host: _baseUri.host,
        path: '${_baseUri.path}forward',
        queryParameters: {
          'access_token': _accessToken,
          if (addressLine1 != null && addressLine1.isNotEmpty)
            'address_line1': addressLine1,
          if (addressNumber != null && addressNumber.isNotEmpty)
            'address_number': addressNumber,
          if (street != null && street.isNotEmpty) 'street': street,
          if (block != null && block.isNotEmpty) 'block': block,
          if (place != null && place.isNotEmpty) 'place': place,
          if (region != null && region.isNotEmpty) 'region': region,
          if (postcode != null && postcode.isNotEmpty) 'postcode': postcode,
          if (locality != null && locality.isNotEmpty) 'locality': locality,
          if (neighborhood != null && neighborhood.isNotEmpty)
            'neighborhood': neighborhood,
          if (countries != null && countries.isNotEmpty)
            'country': countries.map((c) => c.iso3166Alpha2).join(','),
          if (permanent != null) 'permanent': permanent,
          if (autocomplete != null) 'autocomplete': autocomplete,
          if (bbox != null) 'bbox': bbox.toQueryParameter(),
          if (countries != null && countries.isNotEmpty)
            'country': countries.join(','),
          if (format != null) 'format': format.queryParameter,
          if (languages != null && languages.isNotEmpty)
            'language': languages.map((l) => l.toQueryParameter()).join(','),
          if (limit != null) 'limit': limit,
          if (proximity != null) 'proximity': proximity.toQueryParameter(),
          if (featureTypes != null && featureTypes.isNotEmpty)
            'types': featureTypes.map((t) => t.queryParameter).join(','),
          if (worldview != null) 'worldview': worldview.queryParameter
        });

    // Send GET request to the API
    final http.Response response = await http.get(uri);
    // Decode the response
    final Json body = json.decode(response.body);

    // Return Failure when statusCode is not OK
    if (response.statusCode != 200) {
      return MapboxSearchFailure.fromCodeAndJson(response.statusCode, body);
    }

    // Return parsed data when statusCode is OK
    final MapboxSearchGeocodingResponse result =
        MapboxSearchGeocodingResponse.fromJson(json.decode(response.body));
    return MapboxSearchResult<MapboxSearchGeocodingResponse>.success(result);
  }

  /// With Reverse lookup, you can get a list of addresses and POIs around a given coordinate (e,g, what is around 33.9416° N, 118.4085° W).
  /// The /reverse endpoint allows you to look up a single pair of coordinates and returns the geographic feature or features that exist at that location.
  ///
  /// GET https://api.mapbox.com/search/searchbox/v1/reverse?longitude={longitude}&latitude={latitude}
  Future<MapboxSearchResult<MapboxSearchGeocodingResponse>> reverse(

      /// The longitude decimal value from the geographic coordinate for the location being queried.
      double longitude,

      /// The latitude decimal value from the geographic coordinate for the location being queried.
      double latitude,
      {
      /// Specify whether you intend to store the results of the query (true) or not (false, default).
      bool? permanent,

      /// A list of countries.
      List<MapboxSearchCountry>? countries,

      /// Set the language of the text supplied in responses. Also affects result scoring, with results matching the user’s query in the requested language being preferred over results that match in another language. For example, an autocomplete query for things that start with Frank might return Frankfurt as the first result with an English (en) language parameter, but Frankreich (“France”) with a German (de) language parameter.
      /// Options are IETF language tags comprised of a mandatory ISO 639-1 language code and, optionally, one or more IETF subtags for country or script.
      /// More than one value can also be specified, separated by commas. The first language in the list will be considered as the primary language and a response will be generated for it. For other languages, translations will be provided.
      List<MapboxSearchLanguage>? languages,

      /// Specify the maximum number of results to return. The default is 1 and the maximum supported is 5.
      /// The default behavior in reverse geocoding is to return at most one feature at each of the multiple levels of the administrative hierarchy (for example, one address, one region, one country). Increasing the limit allows returning multiple features of the same type, but only for one type (for example, multiple address results). So, setting limit to a higher-than-default value requires specifying exactly one types parameter.
      int? limit,

      /// Filter results to include only a subset (one or more) of the available feature types. Options are country, region, postcode, district, place, locality, neighborhood, street, and address.
      List<MapboxSearchFeatureType>? featureTypes,

      /// Returns features that are defined differently by audiences that belong to various regional, cultural, or political groups. Available worldviews are: ar,cn,in,jp,ma,ru,tr,us. If worldview is not set, the us worldview boundaries are returned by default.
      MapboxSearchGeocodingWorldview? worldview}) async {
    // Validate query and limit parameters
    assert(limit == null || (limit > 0 && limit <= 5),
        'The limit has to be between 1 and 5.');
    assert(limit == null || limit == 1 || featureTypes?.length == 1,
        'Exactly one featureType has to be given when limit is set to 1.');
    assert(
        featureTypes?.onlyContainsAllowedItems(
                MapboxSearchFeatureType.geocodingAllowed) ??
            true,
        'At least one featureType is not allowed for this request.');

    // Construct the request URI with query parameters
    final Uri uri = Uri(
        scheme: _baseUri.scheme,
        host: _baseUri.host,
        path: '${_baseUri.path}reverse',
        queryParameters: {
          'access_token': _accessToken,
          'longitude': longitude,
          'latitude': latitude,
          if (permanent != null) 'permanent': permanent,
          if (countries != null && countries.isNotEmpty)
            'country': countries.map((c) => c.iso3166Alpha2).join(','),
          if (languages != null && languages.isNotEmpty)
            'language': languages.map((l) => l.toQueryParameter()).join(','),
          if (limit != null) 'limit': limit,
          if (featureTypes != null && featureTypes.isNotEmpty)
            'types': featureTypes.map((t) => t.queryParameter).join(','),
          if (worldview != null) 'worldview': worldview.queryParameter
        });

    // Send GET request to the API
    final http.Response response = await http.get(uri);
    // Decode the response
    final Json body = json.decode(response.body);

    // Return Failure when statusCode is not OK
    if (response.statusCode != 200) {
      return MapboxSearchFailure.fromCodeAndJson(response.statusCode, body);
    }

    // Return parsed data when statusCode is OK
    final MapboxSearchGeocodingResponse result =
        MapboxSearchGeocodingResponse.fromJson(json.decode(response.body));
    return MapboxSearchResult<MapboxSearchGeocodingResponse>.success(result);
  }
}
