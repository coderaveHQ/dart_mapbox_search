/// Enum representing all feature types
///
/// Administrative unit types
/// -------------------------
/// Various types of administrative units are available via the Search Box API. Any type might appear as a top-level response, as context in a top-level response, or as a filtering option using the optional types parameter. See the following table for available administrative unit types.
/// - country: Generally recognized countries or, in some cases like Hong Kong, an area of quasi-national administrative status that has a designated country code under ISO 3166-1.
/// - region: Top-level sub-national administrative features, such as states in the United States or provinces in Canada or China.
/// - postcode: Postal codes used in country-specific national addressing systems.
/// - district: Features that are smaller than top-level administrative features but typically larger than cities, in countries that use such an additional layer in postal addressing (for example, prefectures in China).
/// - place: Typically these are cities, villages, municipalities, etc. They’re usually features used in postal addressing, and are suitable for display in ambient end-user applications where current-location context is needed (for example, in weather displays).
/// - locality: Official sub-city features present in countries where such an additional administrative layer is used in postal addressing, or where such features are commonly referred to in local parlance. Examples include city districts in Brazil and Chile and arrondissements in France.
/// - neighborhood: Colloquial sub-city features often referred to in local parlance. Unlike locality features, these typically lack official status and may lack universally agreed-upon boundaries. Not available for reverse lookup requests.
/// - street: The street, with no house number.
/// - address: Individual residential or business addresses as a street with house number.
enum MapboxSearchFeatureType {
  /// Generally recognized countries or, in some cases like Hong Kong, an area of quasi-national administrative status that has a designated country code under ISO 3166-1.
  country('country'),

  /// Top-level sub-national administrative features, such as states in the United States or provinces in Canada or China.
  region('region'),

  /// prefecture
  prefecture('prefecture'),

  /// Postal codes used in country-specific national addressing systems.
  postcode('postcode'),

  /// Features that are smaller than top-level administrative features but typically larger than cities, in countries that use such an additional layer in postal addressing (for example, prefectures in China).
  district('district'),

  /// Typically these are cities, villages, municipalities, etc. They’re usually features used in postal addressing, and are suitable for display in ambient end-user applications where current-location context is needed (for example, in weather displays).
  place('place'),

  /// city
  city('city'),

  /// Official sub-city features present in countries where such an additional administrative layer is used in postal addressing, or where such features are commonly referred to in local parlance. Examples include city districts in Brazil and Chile and arrondissements in France.
  locality('locality'),

  /// oaza
  oaza('oaza'),

  /// block
  block('block'),

  /// Colloquial sub-city features often referred to in local parlance. Unlike locality features, these typically lack official status and may lack universally agreed-upon boundaries. Not available for reverse lookup requests.
  neighborhood('neighborhood'),

  /// The street, with no house number.
  street('street'),

  /// Individual residential or business addresses as a street with house number.
  address('address'),

  /// POI
  poi('poi'),

  /// category
  category('category');

  /// The queryParameter value
  final String queryParameter;

  /// Constructor of MapboxSearchFeatureType
  const MapboxSearchFeatureType(this.queryParameter);

  /// Method for returning a feature type based on a provided value
  static MapboxSearchFeatureType fromString(String value) {
    return MapboxSearchFeatureType.values
        .firstWhere((t) => t.queryParameter == value);
  }

  /// Getter for the allowed feature types inside a Search Box query (not including /reverse)
  static List<MapboxSearchFeatureType> get searchAllowed {
    return <MapboxSearchFeatureType>[
      MapboxSearchFeatureType.country,
      MapboxSearchFeatureType.region,
      MapboxSearchFeatureType.postcode,
      MapboxSearchFeatureType.district,
      MapboxSearchFeatureType.place,
      MapboxSearchFeatureType.city,
      MapboxSearchFeatureType.locality,
      MapboxSearchFeatureType.neighborhood,
      MapboxSearchFeatureType.street,
      MapboxSearchFeatureType.address,
      MapboxSearchFeatureType.poi,
      MapboxSearchFeatureType.category
    ];
  }

  /// Getter for the allowed feature types inside a Search Box reverse query
  static List<MapboxSearchFeatureType> get searchReverseAllowed {
    return <MapboxSearchFeatureType>[
      MapboxSearchFeatureType.country,
      MapboxSearchFeatureType.region,
      MapboxSearchFeatureType.prefecture,
      MapboxSearchFeatureType.postcode,
      MapboxSearchFeatureType.district,
      MapboxSearchFeatureType.place,
      MapboxSearchFeatureType.city,
      MapboxSearchFeatureType.locality,
      MapboxSearchFeatureType.oaza,
      MapboxSearchFeatureType.block,
      MapboxSearchFeatureType.street,
      MapboxSearchFeatureType.address
    ];
  }

  /// Getter for the allowed feature types inside a Geocoding query
  static List<MapboxSearchFeatureType> get geocodingAllowed {
    return <MapboxSearchFeatureType>[
      MapboxSearchFeatureType.country,
      MapboxSearchFeatureType.region,
      MapboxSearchFeatureType.postcode,
      MapboxSearchFeatureType.district,
      MapboxSearchFeatureType.place,
      MapboxSearchFeatureType.locality,
      MapboxSearchFeatureType.neighborhood,
      MapboxSearchFeatureType.street,
      MapboxSearchFeatureType.address
    ];
  }
}
