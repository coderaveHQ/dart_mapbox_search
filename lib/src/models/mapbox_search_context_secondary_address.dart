import 'package:dart_mapbox_search/src/utils/typdefs.dart';

// A class representing secondary address information in the Mapbox search context
class MapboxSearchContextSecondaryAddress {
  // The Mapbox ID of the secondary address
  final String mapboxId;

  // The name associated with the secondary address
  final String name;

  // The designator of the secondary address
  final String designator;

  // The identifier of the secondary address
  final String identifier;

  // Indicates if the secondary address is extrapolated
  final bool extrapolated;

  // Constructor for creating a MapboxSearchContextSecondaryAddress instance
  const MapboxSearchContextSecondaryAddress(
      {required this.mapboxId,
      required this.name,
      required this.designator,
      required this.identifier,
      required this.extrapolated});

  // Factory method for creating a MapboxSearchContextSecondaryAddress instance from a JSON object
  factory MapboxSearchContextSecondaryAddress.fromJson(Json json) {
    return MapboxSearchContextSecondaryAddress(
        mapboxId: json['mapbox_id'] as String,
        name: json['name'] as String,
        designator: json['designator'] as String,
        identifier: json['identifier'] as String,
        extrapolated: json['extrapolated'] as bool);
  }
}
