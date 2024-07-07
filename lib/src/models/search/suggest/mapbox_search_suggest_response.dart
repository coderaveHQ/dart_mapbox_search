import 'package:dart_mapbox_search/src/models/search/suggest/mapbox_search_suggest_response_suggestion.dart';
import 'package:dart_mapbox_search/src/utils/typdefs.dart';

// Represents a response by the /suggest endpoint
class MapboxSearchSuggestResponse {
  // The returned suggestion objects.
  final List<MapboxSearchSuggestResponseSuggestion> suggestions;

  // The attribution data for results.
  final String attribution;

  // Constructor for MapboxSearchSuggestResponse.
  const MapboxSearchSuggestResponse(
      {required this.suggestions, required this.attribution});

  // Factory method to create a MapboxSearchSuggestResponse from JSON data.
  factory MapboxSearchSuggestResponse.fromJson(Json json) {
    return MapboxSearchSuggestResponse(
        // Convert the JSON 'suggestions' array into a list of MapboxSearchSuggestResponseSuggestion objects.
        suggestions: List<Json>.from(json['suggestions'])
            .map((j) => MapboxSearchSuggestResponseSuggestion.fromJson(j))
            .toList(),
        // Extract the 'attribution' string from the JSON.
        attribution: json['attribution'] as String);
  }
}
