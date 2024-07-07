import 'package:dart_mapbox_search/src/enums/mapbox_search_feature_type.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_language.dart';
import 'package:dart_mapbox_search/src/enums/maki_icon.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_poi_category.dart';
import 'package:dart_mapbox_search/src/extensions/generic_extension.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_external.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// Representing the response object of a request to the /suggest endpoint
class MapboxSearchSuggestResponseSuggestion {
  /// The name of the feature.
  final String name;

  /// The preferred name of the feature, if different than name.
  final String? namePreferred;

  /// he id to use with /retrieve to get full feature details.
  final String mapboxId;

  /// The type of the result. For POIs, this will be poi. For categories, this will be category. For address-type results, the global context hierarchy is used (country, region, postcode, district, place, locality, neighborhood, address).
  final MapboxSearchFeatureType featureType;

  /// The address of the result containing the address number and street.
  final String? address;

  /// The full address of the result, which concatenates address and placeFormatted.
  final String? fullAddress;

  /// A formatted string of result context comprised of the place, region, country, and postcode.
  final String placeFormatted;

  /// The context of the feature. This context has layers.
  final MapboxSearchContext context;

  /// The language of the result consisting of an IETF language tag.
  final MapboxSearchLanguage language;

  /// The associated Maki icon to use for this result.
  final MakiIcon? maki;

  /// An array including the POI categories the result falls into, if it is a POI.
  final List<MapboxSearchPoiCategory>? poiCategories;

  /// The brand name of the result, if it is a POI and is applicable.
  final List<String>? brand;

  /// The canonical brand ID of the result, if it is a POI and is applicable.
  final List<String>? brandId;

  /// A list containing objects consisting of the IDs of the feature found in external databases and data source names.
  final List<MapboxSearchExternal>? externals;

  /// An object containing additional metadata for the feature, if applicable.
  final Json? metadata;

  /// An approximate distance to the origin location, in meters. If origin is not provided, it will show the approximate distance to the proximity location, in meters.
  final num? distance;

  /// The estimated time of arrival from the origin point to the feature, in minutes. If origin is not provided, then this will be the estimated time of arrival from the proximity point to the feature, in minutes. Only provided when etaType, navigationProfile and origin / proximity are used in the request. If an address is not on the road network, an ETA will not be provided.
  final num? eta;

  /// The distance added to an input route by including the given suggestion, in meters.
  final num? addedDistance;

  /// The estimated time added to an input route by including the given suggestion, in minutes.
  final num? addedTime;

  /// Constructor for MapboxSearchSuggestResponseSuggestion.
  const MapboxSearchSuggestResponseSuggestion(
      {required this.name,
      this.namePreferred,
      required this.mapboxId,
      required this.featureType,
      this.address,
      this.fullAddress,
      required this.placeFormatted,
      required this.context,
      required this.language,
      this.maki,
      this.poiCategories,
      this.brand,
      this.brandId,
      this.externals,
      this.metadata,
      this.distance,
      this.eta,
      this.addedDistance,
      this.addedTime});

  /// Factory method to create a MapboxSearchSuggestResponseSuggestion from JSON data.
  factory MapboxSearchSuggestResponseSuggestion.fromJson(Json json) {
    return MapboxSearchSuggestResponseSuggestion(
        name: json['name'] as String,
        namePreferred: json['name_preferred'] as String?,
        mapboxId: json['mapbox_id'] as String,
        featureType:
            MapboxSearchFeatureType.fromString(json['feature_type'] as String),
        address: json['address'] as String?,
        fullAddress: json['full_address'] as String?,
        placeFormatted: json['place_formatted'] as String,
        context: MapboxSearchContext.fromJson(json['context'] as Json),
        language: MapboxSearchLanguage.fromString(json['language'] as String),
        maki: (json['maki'] as String?)
            .whenNotNull<MakiIcon>((m) => MakiIcon.fromIdString(m)),
        poiCategories: (json['poi_category_ids'] as List<dynamic>?)
            .whenNotNull<List<MapboxSearchPoiCategory>>((c) =>
                List<String>.from(c)
                    .map((pc) => MapboxSearchPoiCategory.fromIdString(pc))
                    .toList()),
        brand: (json['brand'] as List<dynamic>?)
            .whenNotNull<List<String>>((b) => List<String>.from(b)),
        brandId: (json['brand_id'] as List<dynamic>?)
            .whenNotNull<List<String>>((b) => List<String>.from(b)),
        externals: (json['external_ids'] as Json?)
            .whenNotNull<List<MapboxSearchExternal>>((j) => j.entries
                .map((e) => MapboxSearchExternal.fromKeyValue(e.key, e.value))
                .toList()),
        metadata: json['metadata'] as Json?,
        distance: json['distance'] as num?,
        eta: json['eta'] as num?,
        addedDistance: json['added_distance'] as num?,
        addedTime: json['added_time'] as num?);
  }
}
