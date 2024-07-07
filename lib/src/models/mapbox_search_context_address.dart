import 'package:dart_mapbox_search/src/utils/typdefs.dart';

// A class representing address information in the Mapbox search context
class MapboxSearchContextAddress {
  // The Mapbox ID of the address
  final String? mapboxId;

  // The name associated with the address
  final String name;

  // The address number
  final String addressNumber;

  // The name of the street associated with the address
  final String streetName;

  // Constructor for creating a MapboxSearchContextAddress instance
  const MapboxSearchContextAddress(
      {this.mapboxId,
      required this.name,
      required this.addressNumber,
      required this.streetName});

  // Factory method for creating a MapboxSearchContextAddress instance from a JSON object
  factory MapboxSearchContextAddress.fromJson(Json json) {
    return MapboxSearchContextAddress(
        mapboxId: json['mapbox_id'] as String?,
        name: json['name'] as String,
        addressNumber: json['address_number'] as String,
        streetName: json['street_name'] as String);
  }
}
