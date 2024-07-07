import 'package:dart_mapbox_search/src/extensions/generic_extension.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context_address.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context_country.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context_district.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context_locality.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context_neighborhood.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context_place.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context_postcode.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context_region.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context_secondary_address.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context_street.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// A class representing the context of a Mapbox search result
///
/// The Context Object
/// ------------------
/// The context object within properties is a powerful piece of data which breaks out the complete geographical hierarchy for a given address or place. It is both a reliable way to access the named values of each component part of an address, plus contains feature-specific data such as the Wikidata id and 3-letter alpha country code.
/// Each sub-object in the context always has a mapbox_id and name associated with it. The id can be queried directly via a forward geocoding search to traverse into a different geographical layer. Address features will also include an address sub-object, which additionally contains street_name and address_number properties.
/// A secondary_address feature will also have a matching sub-object in the context
///
/// Translations
/// ------------
/// When providing more than one language in the context object for the country, region, district, place, neighborhood properties will appear the translations property. This is an object where the key is the language code and the value is an object with language and name properties.
class MapboxSearchContext {
  /// Country information of the search result
  final MapboxSearchContextCountry? country;

  /// Region information of the search result
  final MapboxSearchContextRegion? region;

  /// Postcode information of the search result
  final MapboxSearchContextPostcode? postcode;

  /// District information of the search result
  final MapboxSearchContextDistrict? district;

  /// Place information of the search result
  final MapboxSearchContextPlace? place;

  /// Locality information of the search result
  final MapboxSearchContextLocality? locality;

  /// Neighborhood information of the search result
  final MapboxSearchContextNeighborhood? neighborhood;

  /// Address information of the search result
  final MapboxSearchContextAddress? address;

  /// Street information of the search result
  final MapboxSearchContextStreet? street;

  /// Secondary address information of the search result
  final MapboxSearchContextSecondaryAddress? secondaryAddress;

  /// Constructor for creating a MapboxSearchContext instance with optional parameters
  const MapboxSearchContext(
      {this.country,
      this.region,
      this.postcode,
      this.district,
      this.place,
      this.locality,
      this.neighborhood,
      this.address,
      this.street,
      this.secondaryAddress});

  /// Factory method for creating a MapboxSearchContext instance from a JSON object
  factory MapboxSearchContext.fromJson(Json json) {
    return MapboxSearchContext(
        country: (json['country'] as Json?).whenNotNull<MapboxSearchContextCountry>(
            (Json j) => MapboxSearchContextCountry.fromJson(j)),
        region: (json['region'] as Json?).whenNotNull<MapboxSearchContextRegion>(
            (Json j) => MapboxSearchContextRegion.fromJson(j)),
        postcode: (json['postcode'] as Json?).whenNotNull<MapboxSearchContextPostcode>(
            (Json j) => MapboxSearchContextPostcode.fromJson(j)),
        district: (json['district'] as Json?).whenNotNull<MapboxSearchContextDistrict>(
            (Json j) => MapboxSearchContextDistrict.fromJson(j)),
        place: (json['place'] as Json?).whenNotNull<MapboxSearchContextPlace>(
            (Json j) => MapboxSearchContextPlace.fromJson(j)),
        locality: (json['locality'] as Json?)
            .whenNotNull<MapboxSearchContextLocality>((Json j) => MapboxSearchContextLocality.fromJson(j)),
        neighborhood: (json['neighborhood'] as Json?).whenNotNull<MapboxSearchContextNeighborhood>((Json j) => MapboxSearchContextNeighborhood.fromJson(j)),
        address: (json['address'] as Json?).whenNotNull<MapboxSearchContextAddress>((Json j) => MapboxSearchContextAddress.fromJson(j)),
        street: (json['street'] as Json?).whenNotNull<MapboxSearchContextStreet>((Json j) => MapboxSearchContextStreet.fromJson(j)),
        secondaryAddress: (json['secondary_address'] as Json?).whenNotNull<MapboxSearchContextSecondaryAddress>((Json j) => MapboxSearchContextSecondaryAddress.fromJson(j)));
  }
}
