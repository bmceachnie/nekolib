import 'package:nekolib.ui/ui/themes/theme.dart';
import 'package:nekolib.ui/ui/themes/themes.dart';

class ThemeableProperty<T> {
  ThemeableProperty(Map<String, T> values) {
    assert(values.keys.toSet().containsAll(NcThemes.all.keys.toSet()));
    this.values = values;
  }

  late final Map<String, T> values;

  T get value => values[NcThemes.current.name]!;
}
