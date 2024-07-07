import 'package:dart_mapbox_search/src/enums/geocoding/mapbox_search_geocoding_confidence.dart';
import 'package:dart_mapbox_search/src/enums/geocoding/mapbox_search_geocoding_match_code.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

class MapboxSearchGeocodingMatch {
  final MapboxSearchGeocodingMatchCode addressNumber;
  final MapboxSearchGeocodingMatchCode street;
  final MapboxSearchGeocodingMatchCode postcode;
  final MapboxSearchGeocodingMatchCode place;
  final MapboxSearchGeocodingMatchCode region;
  final MapboxSearchGeocodingMatchCode locality;
  final MapboxSearchGeocodingMatchCode country;
  final MapboxSearchGeocodingConfidence confidence;

  const MapboxSearchGeocodingMatch(
      {required this.addressNumber,
      required this.street,
      required this.postcode,
      required this.place,
      required this.region,
      required this.locality,
      required this.country,
      required this.confidence});

  // Factory method to create MapboxSearchGeocodingFeatureProperties from JSON data
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
