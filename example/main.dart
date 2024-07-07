import 'package:dart_mapbox_search/src/mapbox_search.dart';
import 'package:dart_mapbox_search/src/mapbox_search_client.dart';
import 'package:dart_mapbox_search/src/models/search/suggest/mapbox_search_suggest_response.dart';
import 'package:dart_mapbox_search/src/utils/mapbox_search_result.dart';

late final MapboxSearchClient mapboxSearch;

void main() async {
  final MapboxSearch result = MapboxSearch.initialize(accessToken: '...');
  mapboxSearch = result.client;

  final MapboxSearchResult<MapboxSearchSuggestResponse> response =
      await mapboxSearch.search.suggest('scial Headquarter');
  response.fold(
      onSuccess: (MapboxSearchSuggestResponse data) => print('Data found!'),
      onFailure: (int statusCode, String? message, String? error) =>
          print('Error occured.'));
}
