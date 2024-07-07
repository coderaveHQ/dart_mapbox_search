import 'package:dart_mapbox_search/src/models/search/list_categories/mapbox_search_list_categories_response_list_item.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

class MapboxSearchListCategoriesResponse {
  // An array of category objects
  final List<MapboxSearchListCategoriesResponseListItem> listItems;

  // The attribution data for results.
  final String attribution;

  // The service version information. Include this information if you report an issue to Mapbox.
  final String version;

  // Constructor for MapboxSearchListCategoriesResponse.
  const MapboxSearchListCategoriesResponse(
      {required this.listItems,
      required this.attribution,
      required this.version});

  // Factory method to create a MapboxSearchListCategoriesResponse from JSON data.
  factory MapboxSearchListCategoriesResponse.fromJson(Json json) {
    return MapboxSearchListCategoriesResponse(
        listItems: List<Json>.from(json['listItems'])
            .map((j) => MapboxSearchListCategoriesResponseListItem.fromJson(j))
            .toList(),
        attribution: json['attribution'] as String,
        version: json['version'] as String);
  }
}
