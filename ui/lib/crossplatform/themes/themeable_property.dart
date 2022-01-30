import 'package:nekolib.ui/crossplatform.dart';

/// A value that can change its value based on the current active theme.
/// This is useful for values that are not defined in [NcTheme] but you still want to have the value theme dependend.
class ThemeableProperty<T> {
  /// Creates a new [ThemeableProperty] with a map of [T] values. Each [NcTheme] in the [NcThemes.all] database needs to be a key in the map.
  ThemeableProperty(Map<NcTheme, T> values) {
    assert(values.keys.toSet().containsAll(NcThemes.all.values.toSet()));
    this.values = Map.unmodifiable(values);
  }

  /// Creates a new [ThemeableProperty] with a single [T] value for each [NcTheme] in [NcThemes.all].
  ThemeableProperty.all(T value) {
    var allValues = <NcTheme, T>{};

    for (var theme in NcThemes.all.values) allValues[theme] = value;

    this.values = Map.unmodifiable(allValues);
  }

  /// Creates a new [ThemeableProperty] with a given Map and inserts a [T] value for all undefined [NcTheme] in [NcThemes.all].
  ThemeableProperty.only(T defaultValue, Map<NcTheme, T> values) {
    var allValues = <NcTheme, T>{};

    for (var theme in NcThemes.all.values) allValues[theme] = values[theme] ?? defaultValue;

    this.values = Map.unmodifiable(allValues);
  }

  /// The map of [T] values that correspond to each [NcTheme] in [NcThemes.all].
  late final Map<NcTheme, T> values;

  /// The current value of this property that corresponds to the current active [NcTheme].
  T get value => values[NcThemes.current.name]!;
}
