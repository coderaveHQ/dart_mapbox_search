import 'package:dart_mapbox_search/src/enums/geocoding/mapbox_search_geocoding_confidence.dart';
import 'package:dart_mapbox_search/src/enums/geocoding/mapbox_search_geocoding_match_code.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// Represents all match codes in a single class
class MapboxSearchGeocodingMatch {
  /// Indicator if the addressNumber matches
  final MapboxSearchGeocodingMatchCode addressNumber;

  /// Indicator if the street matches
  final MapboxSearchGeocodingMatchCode street;

  /// Indicator if the postcode matches
  final MapboxSearchGeocodingMatchCode postcode;

  /// Indicator if the place matches
  final MapboxSearchGeocodingMatchCode place;

  /// Indicator if the region matches
  final MapboxSearchGeocodingMatchCode region;

  /// Indicator if the locality matches
  final MapboxSearchGeocodingMatchCode locality;

  /// Indicator if the country matches
  final MapboxSearchGeocodingMatchCode country;

  /// Indicator if the confidence matches
  final MapboxSearchGeocodingConfidence confidence;

  /// Constructor of MapboxSearchGeocodingMatch
  const MapboxSearchGeocodingMatch(
      {required this.addressNumber,
      required this.street,
      required this.postcode,
      required this.place,
      required this.region,
      required this.locality,
      required this.country,
      required this.confidence});

  /// Factory method to create MapboxSearchGeocodingFeatureProperties from JSON data
  factory MapboxSearchGeocodingMatch.fromJson(Json json) {
    return MapboxSearchGeocodingMatch(
        addressNumber:
            MapboxSearchGeocodingMatchCode.fromId(json['address_number']),
        street: MapboxSearchGeocodingMatchCode.fromId(json['street']),
        postcode: MapboxSearchGeocodingMatchCode.fromId(json['postcode']),
        place: MapboxSearchGeocodingMatchCode.fromId(json['place']),
        region: MapboxSearchGeocodingMatchCode.fromId(json['region']),
        locality: MapboxSearchGeocodingMatchCode.fromId(json['locality']),
        country: MapboxSearchGeocodingMatchCode.fromId(json['country']),
        confidence: MapboxSearchGeocodingConfidence.fromId(json['confidence']));
  }
}
