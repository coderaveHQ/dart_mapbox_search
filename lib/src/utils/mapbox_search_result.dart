import 'dart:async';

import 'package:dart_mapbox_search/src/utils/typdefs.dart';

/// Abstract class representing the result of a Mapbox search
sealed class MapboxSearchResult<S> {
  /// Constructor for MapboxSearchResult
  const MapboxSearchResult();

  /// Factory constructor to create a success result
  factory MapboxSearchResult.success(S value) => MapboxSearchSuccess<S>(value);

  /// Factory constructor to create a failure result
  factory MapboxSearchResult.failure(
          int statusCode, String? message, String? error) =>
      MapboxSearchFailure<S>(statusCode, message, error);

  /// Getter to check if the result is a success
  bool get isSuccess;

  /// Getter to check if the result is a failure
  bool get isFailure;

  /// Method to handle both success and failure cases
  FutureOr<R> fold<R>(
      {required FutureOr<R> Function(S value) onSuccess,
      required FutureOr<R> Function(
              int statusCode, String? message, String? error)
          onFailure}) async {
    // If the result is a success, call the onSuccess function with the value
    if (this is MapboxSearchSuccess) {
      return await onSuccess((this as MapboxSearchSuccess<S>).value);
    }
    // If the result is a failure, call the onFailure function with the status code, message, and error
    else if (this is MapboxSearchFailure) {
      return await onFailure(
          (this as MapboxSearchFailure<S>).statusCode,
          (this as MapboxSearchFailure<S>).message,
          (this as MapboxSearchFailure<S>).error);
    }
    // Throw an exception if the result type is unexpected
    else {
      throw Exception('Unexpected result type');
    }
  }
}

/// Class representing a successful Mapbox search result
final class MapboxSearchSuccess<S> extends MapboxSearchResult<S> {
  /// The value of the successful result
  final S value;

  /// Constructor for MapboxSearchSuccess
  const MapboxSearchSuccess(this.value);

  // Override to indicate this is a success
  @override
  bool get isSuccess => true;

  // Override to indicate this is not a failure
  @override
  bool get isFailure => false;
}

/// Class representing a failed Mapbox search result
final class MapboxSearchFailure<S> extends MapboxSearchResult<S> {
  /// The status code of the failure
  final int statusCode;

  /// The message of the failure, if any
  final String? message;

  /// The error of the failure, if any
  final String? error;

  /// Constructor for MapboxSearchFailure
  const MapboxSearchFailure(this.statusCode, this.message, this.error);

  /// Factory constructor to create a failure result from a status code and JSON response
  factory MapboxSearchFailure.fromCodeAndJson(int statusCode, Json json) {
    return MapboxSearchFailure<S>(
        statusCode, json['message'] as String?, json['error'] as String?);
  }

  // Override to indicate this is not a success
  @override
  bool get isSuccess => false;

  // Override to indicate this is a failure
  @override
  bool get isFailure => true;
}
