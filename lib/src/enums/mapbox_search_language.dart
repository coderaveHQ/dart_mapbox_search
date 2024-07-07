/// Enum representing all supported languages
///
/// Search Box API
/// --------------
/// Language and Geography Support
/// ------------------------------
/// The Search Box API supports text queries in following languages; Czech, Croatian, Danish, Dutch, English, Estonian, Finnish, French, German, Greek, Hungarian, Italian, Japanese, Lithuanian, Latvian, Polish, Portuguese, Romanian, Russian, Slovak, Slovenian, Spanish, Swedish, Turkish, Ukrainian.
/// You can set a language by providing supported IETF language tags to the language API parameter. You can also provide a comma separated list of language codes. In this case, the first supported language encountered in the list will be used to process the request.
///
/// Supported geographies
/// ---------------------
/// The Search Box API supports United States, Canada and Europe.
///
/// Geocoding API
/// -------------
/// Language coverage
/// -----------------
/// Translation availability also varies by language and region. We provide the following tiers of language support:
///
/// Global coverage
/// ---------------
/// These languages are almost always present for country, region, and prominent place features.
/// - de: German
/// - en: English
/// - es: Spanish
/// - fr: French
/// - it: Italian
/// - nl: Dutch
/// - pl: Polish
///
/// Local coverage
/// --------------
/// These languages may lack global coverage but are almost always present for country, region, and prominent place features where they are widely used.
/// - az: Azerbaijani
/// - bn: Bengali
/// - ca: Catalan
/// - cs: Czech
/// - da: Danish
/// - el: Modern Greek
/// - fa: Persian
/// - fi: Finnish
/// - ga: Irish
/// - hu: Hungarian
/// - id: Indonesian
/// - is: Icelandic
/// - ja: Japanese
/// - ka: Geogian
/// - km: Central Khmer
/// - ko: Korean
/// - lt: Lithuanian
/// - lv: Latvian
/// - mn: Monolian
/// - pt: Portuguese
/// - ro: Romanian
/// - sk: Slovak
/// - sq: Albanian
/// - sv: Swedish
/// - th: Thai
/// - tl: Tagalog
/// - uk: Ukrainian
/// - vi: Vietnamese
/// - zh: Chinese
/// - zh_Hans: Simplified Chinese
/// - zh_TW: Taiwanese Mandarin
///
/// Limited coverage
/// ----------------
/// These languages are sometimes present but coverage tends to be inconsistent or geographically constrained.
/// - ar: Arabic
/// - bs: Bosnian
/// - gu: Gujarati
/// - he: Hebrew
/// - hi: Hindi
/// - kk: Kazakh
/// - lo: Lao
/// - my: Burmese
/// - nb: Norwegian Bokmål
/// - ru: Russian
/// - sr: Serbian
/// - te: Telugu
/// - tk: Turkmen
/// - tr: Turkish
/// - zh_Hant: Traditional Chinese
enum MapboxSearchLanguage {
  de('de', null),
  en('en', null),
  es('es', null),
  fr('fr', null),
  it('it', null),
  nl('nl', null),
  pl('pl', null),
  az('az', null),
  bn('bn', null),
  ca('ca', null),
  cs('cs', null),
  da('da', null),
  el('el', null),
  fa('fa', null),
  fi('fi', null),
  ga('ga', null),
  hu('hu', null),
  id('id', null),
  is_('is', null),
  ja('ja', null),
  ka('ka', null),
  km('km', null),
  ko('ko', null),
  lt('lt', null),
  lv('lv', null),
  mn('mn', null),
  pt('pt', null),
  ro('ro', null),
  sk('sk', null),
  sq('sq', null),
  sv('sv', null),
  th('th', null),
  tl('tl', null),
  uk('uk', null),
  vi('vi', null),
  zh('zh', null),
  zhHans('zh_Hans', null),
  zhTW('zh_TW', null),
  ar('ar', null),
  bs('bs', null),
  gu('gu', null),
  he('he', null),
  hi('hi', null),
  kk('kk', null),
  lo('lo', null),
  my('my', null),
  nb('nb', null),
  ru('ru', null),
  sr('sr', null),
  te('te', null),
  tk('tk', null),
  tr('tr', null),
  zhHant('zh_Hant', null);

  final String iso639_1;
  final String? ietf;

  const MapboxSearchLanguage(this.iso639_1, this.ietf);

  // Method for returning the corresponding concenated code
  String toQueryParameter() {
    return ietf != null ? '$iso639_1-$ietf' : iso639_1;
  }

  // Method for returning a language based on a provided value
  static MapboxSearchLanguage fromString(String value) {
    return MapboxSearchLanguage.values
        .firstWhere((p) => p.toQueryParameter() == value);
  }
}
