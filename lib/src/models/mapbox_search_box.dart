// A class representing a BBOX (bounding box) object for Mapbox search functionality
class MapboxSearchBox {
  // Minimum longitude of the bounding box
  final double minimumLongitude;

  // Minimum latitude of the bounding box
  final double minimumLatitude;

  // Maximum longitude of the bounding box
  final double maximumLongitude;

  // Maximum latitude of the bounding box
  final double maximumLatitude;

  // Constructor for creating a MapboxSearchBox instance with required coordinates
  const MapboxSearchBox(
      {required this.minimumLongitude,
      required this.minimumLatitude,
      required this.maximumLongitude,
      required this.maximumLatitude});

  // Factory method for creating a MapboxSearchBox instance from a list of doubles
  // The list is expected to contain four elements: [minLongitude, minLatitude, maxLongitude, maxLatitude]
  factory MapboxSearchBox.fromList(List<double> list) {
    return MapboxSearchBox(
        minimumLongitude: list[0],
        minimumLatitude: list[1],
        maximumLongitude: list[2],
        maximumLatitude: list[3]);
  }

  // Method for converting the bounding box coordinates to a query parameter string
  // The format of the returned string is: "minLongitude,minLatitude,maxLongitude,maxLatitude"
  String toQueryParameter() {
    return '$minimumLongitude,$minimumLatitude,$maximumLongitude,$maximumLatitude';
  }
}
