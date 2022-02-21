part of core;

/// Predefined spacings.
///
/// Spacing is horizontally and vertically.
class NcSpacing extends StatelessWidget {
  /// Extra small spacing. Uses [NcSpacing.xsSpacing].
  NcSpacing.xs({Key? key}) : super(key: key) {
    spacing = xsSpacing;
  }

  /// Small spacing. Uses [NcSpacing.smallSpacing].
  NcSpacing.small({Key? key}) : super(key: key) {
    spacing = smallSpacing;
  }

  /// Medium spacing. Uses [NcSpacing.mediumSpacing].
  NcSpacing.medium({Key? key}) : super(key: key) {
    spacing = mediumSpacing;
  }

  /// Large spacing. Uses [NcSpacing.largeSpacing].
  NcSpacing.large({Key? key}) : super(key: key) {
    spacing = largeSpacing;
  }

  /// Extra large spacing. Uses [NcSpacing.xlSpacing].
  NcSpacing.xl({Key? key}) : super(key: key) {
    spacing = xlSpacing;
  }

  /// Value for extra small spacing. Used in [NcSpacing.xs].
  static const double xsSpacing = 5;

  /// Value for small spacing. Used in [NcSpacing.small].
  static const double smallSpacing = 10;

  /// Value for medium spacing. Used in [NcSpacing.medium].
  static const double mediumSpacing = 20;

  /// Value for large spacing. Used in [NcSpacing.large].
  static const double largeSpacing = 25;

  /// Value for extra large spacing. Used in [NcSpacing.xl].
  static const double xlSpacing = 30;

  /// The spacing value used.
  /// One of the following values: [NcSpacing.xsSpacing], [NcSpacing.smallSpacing], [NcSpacing.mediumSpacing], [NcSpacing.largeSpacing], [NcSpacing.xlSpacing].
  late final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spacing, height: spacing);
  }
}
