import 'package:nekolib.ui/ui/themes/themes.dart';

class ThemeableProperty<T> {
  ThemeableProperty(Map<String, T> values) {
    assert(values.keys.toSet().containsAll(NcThemes.all.keys.toSet()));
    this.values = values;
  }

  ThemeableProperty.fromTheme(Map<NcTheme, T> values) {
    var namedValues = values.map((theme, value) => MapEntry(theme.name, value));
    assert(namedValues.keys.toSet().containsAll(NcThemes.all.keys.toSet()));
    this.values = Map.unmodifiable(namedValues);
  }

  ThemeableProperty.all(T value) {
    var allValues = {};

    for (var theme in NcThemes.all.keys) allValues[theme] = value;

    this.values = Map.unmodifiable(allValues);
  }

  ThemeableProperty.only(T defaultValue, Map<String, T> values) {
    var allValues = {};

    for (var theme in NcThemes.all.keys) allValues[theme] = values[theme] ?? defaultValue;

    this.values = Map.unmodifiable(allValues);
  }

  late final Map<String, T> values;

  T get value => values[NcThemes.current.name]!;
}
