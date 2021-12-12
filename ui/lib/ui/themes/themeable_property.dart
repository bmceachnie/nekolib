import 'package:nekolib.ui/ui/themes/themes.dart';

class ThemeableProperty<T> {
  ThemeableProperty(Map<String, T> values) {
    assert(values.keys.toSet().containsAll(NcThemes.all.keys.toSet()));
    this.values = values;
  }

  ThemeableProperty.fromTheme(Map<NcTheme, T> values) {
    assert(values.keys.toSet().containsAll(NcThemes.all.values.toSet()));
    this.values = values.map((theme, value) => MapEntry(theme.name, value));
  }

  late final Map<String, T> values;

  T get value => values[NcThemes.current.name]!;
}
