part of 'package:flutter_addons/flutter_addons.dart';

extension ExtendJson on Map {
  /// Merges the current map with one or more source maps.
  Map extend(Map source, [Iterable<Map>? additionalSources]) {
    _mergeMap(source);
    additionalSources?.forEach(_mergeMap);
    return this;
  }

  /// Merges the current map with a given source map.
  void _mergeMap(Map source) {
    source.forEach((key, value) {
      if (containsKey(key)) {
        final currentValue = this[key];
        if (currentValue is Map && value is Map) {
          (currentValue).extend(value);
        } else {
          this[key] = value;
        }
      } else {
        this[key] = value;
      }
    });
  }
}

Map extend(Map target, Map source, [Iterable<Map>? sources]) =>
    target.extend(source, sources);

Map extendAll(Map target, Iterable<Map> sources) =>
    target.extend(sources.first, sources.skip(1));

/// Merges the current map with one or more source maps.
/// The original map is modified.
///
/// Example:
/// ```dart
/// var base = {
///   'name': 'John',
///   'address': {
///     'city': 'New York',
///   }
/// };
///
/// var update = {
///   'age': 30,
///   'address': {
///     'city': 'Los Angeles',
///     'country': 'USA',
///   }
/// };
///
/// base.extend(update);
/// print(base); // Output: {'name': 'John', 'address': {'city': 'Los Angeles', 'country': 'USA'}, 'age': 30}
/// ``
