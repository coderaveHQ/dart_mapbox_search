import 'package:dart_mapbox_search/src/enums/mapbox_search_feature_type.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_language.dart';
import 'package:dart_mapbox_search/src/enums/maki_icon.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_poi_category.dart';
import 'package:dart_mapbox_search/src/extensions/generic_extension.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_box.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_context.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_external.dart';
import 'package:dart_mapbox_search/src/models/mapbox_search_feature_properties_coordinates.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// Representing the properties of a Mapbox feature
class MapboxSearchSearchFeatureProperties {
  /// The name of the feature.
  final String name;

  /// The preferred name of the feature, if different than name.
  final String? namePreferred;

  /// The ID associated with the feature.
  final String mapboxId;

  /// The type of the result. For POIs, this will be poi. For address-type results, the global context hierarchy is used (country, region, postcode, district, place, locality, neighborhood, address).
  final MapboxSearchFeatureType featureType;

  /// The address of the result containing the address number and street.
  final String? address;

  /// The full address of the result, which concatenates address and place_formatted.
  final String? fullAddress;

  /// A formatted string of result context comprised of the place, region, country, and postcode. It is the part of the result which comes after address.
  final String? placeFormatted;

  /// The context of the feature.
  final MapboxSearchContext context;

  /// The geographical coordinates of the result.
  final MapboxSearchFeaturePropertiesCoordinates coordinates;

  /// A bounding box.
  final MapboxSearchBox? bbox;

  /// The language of the result consisting of an IETF language tag.
  final MapboxSearchLanguage? language;

  /// An associated Maki icon to use for this result.
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

  /// Constructor for MapboxSearchSearchFeatureProperties
  const MapboxSearchSearchFeatureProperties(
      {required this.name,
      this.namePreferred,
      required this.mapboxId,
      required this.featureType,
      this.address,
      this.fullAddress,
      this.placeFormatted,
      required this.context,
      required this.coordinates,
      this.bbox,
      this.language,
      this.maki,
      this.poiCategories,
      this.brand,
      this.brandId,
      this.externals,
      this.metadata});

  /// Factory method to create MapboxSearchSearchFeatureProperties from JSON data
  factory MapboxSearchSearchFeatureProperties.fromJson(Json json) {
    return MapboxSearchSearchFeatureProperties(
      name: json['name'] as String,
      namePreferred: json['name_preferred'] as String?,
      mapboxId: json['mapbox_id'] as String,
      featureType:
          MapboxSearchFeatureType.fromString(json['feature_type'] as String),
      address: json['address'] as String?,
      fullAddress: json['full_address'] as String?,
      placeFormatted: json['place_formatted'] as String?,
      context: MapboxSearchContext.fromJson(json['context'] as Json),
      coordinates: MapboxSearchFeaturePropertiesCoordinates.fromJson(
          json['coordinates'] as Json),
      bbox: (json['bbox'] as List<dynamic>?).whenNotNull<MapboxSearchBox>(
          (b) => MapboxSearchBox.fromList(List<double>.from(b))),
      language: (json['language'] as String?).whenNotNull<MapboxSearchLanguage>(
          (l) => MapboxSearchLanguage.fromString(l)),
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
    );
  }
}
