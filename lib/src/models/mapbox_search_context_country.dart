import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// A class representing country information in the Mapbox search context
class MapboxSearchContextCountry {
  /// The Mapbox ID of the country
  final String? mapboxId;

  /// The name of the country
  final String name;

  /// The two-letter country code (ISO 3166-1 alpha-2)
  final String countryCode;

  /// The three-letter country code (ISO 3166-1 alpha-3)
  final String countryCodeAlpha3;

  /// A JSON object containing translations of the country name
  final Json? translations;

  /// Constructor for creating a MapboxSearchContextCountry instance
  const MapboxSearchContextCountry(
      {this.mapboxId,
      required this.name,
      required this.countryCode,
      required this.countryCodeAlpha3,
      this.translations});

  /// Factory method for creating a MapboxSearchContextCountry instance from a JSON object
  factory MapboxSearchContextCountry.fromJson(Json json) {
    return MapboxSearchContextCountry(
        mapboxId: json['mapbox_id'] as String?,
        name: json['name'] as String,
        countryCode: json['country_code'] as String,
        countryCodeAlpha3: json['country_code_alpha_3'] as String,
        translations: json['translations'] as Json?);
  }
}
