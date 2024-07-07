# dart_mapbox_search

Mapbox Search made easy! 💎

A Dart package for interacting with the Mapbox Search Box and Geocoding APIs. It provides a set of utilities and models to facilitate integration with Mapbox's powerful search capabilities.

[![pub package](https://img.shields.io/pub/v/shelf.svg)](https://pub.dev/packages/dart_mapbox_search)
[![License](https://img.shields.io/badge/License-GNU%20GPL-blue)](https://opensource.org/license/gpl-3-0)

Developed with 💙 and maintained by [scial.app](https://scial.app)

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/scial.app)

## Supported features

| Feature                                  | API             | Endpoint       | Available          |
| ---------------------------------------- | --------------- | -------------- | ------------------ |
| Get suggested results                    | Search Box API  | /suggest       | :white_check_mark: |
| Retrieve a suggested feature             | Search Box API  | /retrieve      | :white_check_mark: |
| Get search results                       | Search Box API  | /forward       | :white_check_mark: |
| Retrieve POIs by category                | Search Box API  | /category      | :white_check_mark: |
| Get category list                        | Search Box API  | /list/category | :white_check_mark: |
| Do a reverse lookup                      | Search Box API  | /reverse       | :white_check_mark: |
| Forward geocoding with search text input | Geocoding API   | /forward       | :white_check_mark: |
| Forward geocoding with structured input  | Geocoding API   | /forward       | :white_check_mark: |
| Reverse geocoding                        | Geocoding API   | /reverse       | :white_check_mark: |
| Batch geocoding                          | Geocoding API   | /batch         | :x:                |

## Quick Start 🚀

### Installation 🧑‍💻

In the `dependencies` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  dart_mapbox_search: <latest_version>
```

### Usage 👽

Import the package:

```dart
import 'package:dart_mapbox_search/dart_mapbox_search.dart';
```

Create an instance:

```dart
late final MapboxSearchClient mapboxSearch;

void main() async {
    final MapboxSearch result = MapboxSearch.initialize(accessToken: '...');
    mapboxSearch = result.client;
}
```

Make use of one of the many methods provided by this package e.g.:

```dart
final MapboxSearchResult<MapboxSearchSuggestResponse> response = await mapboxSearch.search.suggest('scial Headquarter');
response.fold(
    onSuccess: (MapboxSearchSuggestResponse data) => print('Data found!'), 
    onFailure: (int statusCode, String? message, String? error) => print('Error occured.')
);
```

## Contribution 💙

Always open for contribution! Contributors will be listed here.