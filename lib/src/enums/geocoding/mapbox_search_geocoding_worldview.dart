/// Enum representing all supported worldviews
/// Worldviews
/// ----------
/// Use the optional worldview parameter to identify geographic features whose characteristics are defined differently by audiences belonging to various regional, cultural, or political groups. The Geocoding API only supports worldviews for the country and region data types, but may expand to additional data types in the future.
///
/// Available worldviews
/// --------------------
/// The Geocoding API supports the following values for the worldview parameter:
/// - ar: Features for an Argentinian audience
/// - cn: Features for a mainland Chinese audience
/// - in: Features for an Indian audience
/// - jp: Features for a Japanese audience
/// - ma: Features for a Moroccan audience
/// - ru: Features for a Russian audience
/// - tr: Features for a Turkish audience
/// - us: Features for an American audience
///
/// Returned features are not officially approved for use by the above countries' respective governments.
///
/// Each query supports a maximum of one worldview. Attempting to query for multiple worldviews in one search will result in an error message. When no worldview is selected, the Geocoding API returns features for the us worldview.
///
/// Using the worldview parameter
/// -----------------------------
/// In Mapbox services, the worldview data field is used to identify geographic features whose characteristics are defined differently by audiences belonging to various regional, cultural, or political groups. Setting a worldview affects the place values returned for an address that is located in an area of non-unanimous ownership or definition.
/// For example, consider an address in the Ilemi Triangle, which borders Eastern Equatoria (South Sudan) and Turkana (Kenya). Depending on the worldview selected, an address in this location will be returned in different country contexts:
/// - If worldview=cn, Kaaleng, Eastern Equatoria, or South Sudan will be returned.
/// - If worldview=us, Kaaleng, Turkana, or Kenya will be returned.
///
/// This means that if you use wordlview=cn worldview with the Kenya (ke) country filter, a search for an address in this area will not be successful. Instead, you would need to use worldview=cn in combination with the South Sudan (ss) country filter.
/// Be cautious when combining worldview with the country parameter, since these indices are only loosely coupled.
enum MapboxSearchGeocodingWorldview {
  ar('ar'),
  cn('cn'),
  in_('in'),
  jp('jp'),
  ma('ma'),
  ru('ru'),
  tr('tr'),
  us('us');

  final String queryParameter;

  const MapboxSearchGeocodingWorldview(this.queryParameter);
}
