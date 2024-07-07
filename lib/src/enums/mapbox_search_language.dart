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
  /// de: German
  de('de', null),

  /// en: English
  en('en', null),

  /// es: Spanish
  es('es', null),

  /// fr: French
  fr('fr', null),

  /// it: Italian
  it('it', null),

  /// nl: Dutch
  nl('nl', null),

  /// pl: Polish
  pl('pl', null),

  /// az: Azerbaijani
  az('az', null),

  /// bn: Bengali
  bn('bn', null),

  /// ca: Catalan
  ca('ca', null),

  /// cs: Czech
  cs('cs', null),

  /// da: Danish
  da('da', null),

  /// el: Modern Greek
  el('el', null),

  /// fa: Persian
  fa('fa', null),

  /// fi: Finnish
  fi('fi', null),

  /// ga: Irish
  ga('ga', null),

  /// hu: Hungarian
  hu('hu', null),

  /// id: Indonesian
  id('id', null),

  /// is_: Icelandic
  is_('is', null),

  /// ja: Japanese
  ja('ja', null),

  /// ka: Geogian
  ka('ka', null),

  /// km: Central Khmer
  km('km', null),

  /// ko: Korean
  ko('ko', null),

  /// lt: Lithuanian
  lt('lt', null),

  /// lv: Latvian
  lv('lv', null),

  /// mn: Monolian
  mn('mn', null),

  /// pt: Portuguese
  pt('pt', null),

  /// ro: Romanian
  ro('ro', null),

  /// sk: Slovak
  sk('sk', null),

  /// sq: Albanian
  sq('sq', null),

  /// sv: Swedish
  sv('sv', null),

  /// th: Thai
  th('th', null),

  /// tl: Tagalog
  tl('tl', null),

  /// uk: Ukrainian
  uk('uk', null),

  /// vi: Vietnamese
  vi('vi', null),

  /// zh: Chinese
  zh('zh', null),

  /// zhHans: Simplified Chinese
  zhHans('zh_Hans', null),

  /// zhTW: Taiwanese Mandarin
  zhTW('zh_TW', null),

  /// ar: Arabic
  ar('ar', null),

  /// bs: Bosnian
  bs('bs', null),

  /// gu: Gujarati
  gu('gu', null),

  /// he: Hebrew
  he('he', null),

  /// hi: Hindi
  hi('hi', null),

  /// kk: Kazakh
  kk('kk', null),

  /// lo: Lao
  lo('lo', null),

  /// my: Burmese
  my('my', null),

  /// nb: Norwegian Bokmål
  nb('nb', null),

  /// ru: Russian
  ru('ru', null),

  /// sr: Serbian
  sr('sr', null),

  /// te: Telugu
  te('te', null),

  /// tk: Turkmen
  tk('tk', null),

  /// tr: Turkish
  tr('tr', null),

  /// zhHant: Traditional Chinese
  zhHant('zh_Hant', null);

  /// The iso639_1 code
  final String iso639_1;

  /// The ietf code
  final String? ietf;

  /// The constructor of MapboxSearchLanguage
  const MapboxSearchLanguage(this.iso639_1, this.ietf);

  /// Method for returning the corresponding concenated code
  String toQueryParameter() {
    return ietf != null ? '$iso639_1-$ietf' : iso639_1;
  }

  /// Method for returning a language based on a provided value
  static MapboxSearchLanguage fromString(String value) {
    return MapboxSearchLanguage.values
        .firstWhere((p) => p.toQueryParameter() == value);
  }
}
