import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// A class representing postcode information in the Mapbox search context
class MapboxSearchContextPostcode {
  /// The Mapbox ID of the postcode
  final String? mapboxId;

  /// The name associated with the postcode
  final String name;

  /// Constructor for creating a MapboxSearchContextPostcode instance
  const MapboxSearchContextPostcode({this.mapboxId, required this.name});

  /// Factory method for creating a MapboxSearchContextPostcode instance from a JSON object
  factory MapboxSearchContextPostcode.fromJson(Json json) {
    return MapboxSearchContextPostcode(
        mapboxId: json['mapbox_id'] as String?, name: json['name'] as String);
  }
}
