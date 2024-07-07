// A class representing external IDs associated with a Mapbox search result
class MapboxSearchExternal {
  // The name of the external datasource
  final String datasourceName;

  // The ID associated with the external datasource
  final String id;

  // Constructor for creating a MapboxSearchExternal instance
  const MapboxSearchExternal({required this.datasourceName, required this.id});

  // Factory method for creating a MapboxSearchExternal instance from key-value pair
  factory MapboxSearchExternal.fromKeyValue(String key, String value) {
    return MapboxSearchExternal(datasourceName: key, id: value);
  }
}
