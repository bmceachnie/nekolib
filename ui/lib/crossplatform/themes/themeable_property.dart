import 'package:nekolib.ui/crossplatform.dart';

class ThemeableProperty<T> {
  ThemeableProperty(Map<NcTheme, T> values) {
    assert(values.keys.toSet().containsAll(NcThemes.all.values.toSet()));
    this.values = Map.unmodifiable(values);
  }

  ThemeableProperty.all(T value) {
    var allValues = <NcTheme, T>{};

    for (var theme in NcThemes.all.values) allValues[theme] = value;

    this.values = Map.unmodifiable(allValues);
  }

  ThemeableProperty.only(T defaultValue, Map<NcTheme, T> values) {
    var allValues = <NcTheme, T>{};

    for (var theme in NcThemes.all.values) allValues[theme] = values[theme] ?? defaultValue;

    this.values = Map.unmodifiable(allValues);
  }

  late final Map<NcTheme, T> values;

  T get value => values[NcThemes.current.name]!;
}
