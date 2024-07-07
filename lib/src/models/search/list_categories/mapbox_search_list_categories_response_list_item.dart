import 'package:dart_mapbox_search/src/enums/maki_icon.dart';
import 'package:dart_mapbox_search/src/enums/mapbox_search_poi_category.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

class MapboxSearchListCategoriesResponseListItem {
  // The category to use in a category “Hot Button” search
  final MapboxSearchPoiCategory category;

  // The Maki icon to use with the category
  final MakiIcon icon;

  // The category name in the requested language
  final String name;

  // The service version information. Include this information if you report an issue to Mapbox.
  final String version;

  // The UUID of the list item
  final String uuid;

  // Constructor for MapboxSearchListCategoriesResponseListItem.
  const MapboxSearchListCategoriesResponseListItem(
      {required this.category,
      required this.icon,
      required this.name,
      required this.version,
      required this.uuid});

  // Factory method to create a MapboxSearchListCategoriesResponseListItem from JSON data.
  factory MapboxSearchListCategoriesResponseListItem.fromJson(Json json) {
    return MapboxSearchListCategoriesResponseListItem(
        category: MapboxSearchPoiCategory.fromIdString(
            json['canonical_id'] as String),
        icon: MakiIcon.fromIdString(json['icon'] as String),
        name: json['name'] as String,
        version: json['version'] as String,
        uuid: json['uuid'] as String);
  }
}
