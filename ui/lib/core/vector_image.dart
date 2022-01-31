part of nekolib_ui_core;

/// Enables theming of vector graphics.
///
/// Usage:
/// - [NcVectorImage.primaryColor] &rarr; Interpolate this into the SVG code to use the primary color of the [NcThemes.current] theme.
/// - [NcVectorImage.secondaryColor] &rarr; Interpolate this into the SVG code to use the secondary color of the [NcThemes.current] theme.
/// - [NcVectorImage.tertiaryColor] &rarr; Interpolate this into the SVG code to use the tertiary color of the [NcThemes.current] theme.
/// - [NcVectorImage.accentColor] &rarr; Interpolate this into the SVG code to use the accent color of the [NcThemes.current] theme.
/// - [NcVectorImage.textColor] &rarr; Interpolate this into the SVG code to use the text color of the [NcThemes.current] theme.
/// - [NcVectorImage.buttonTextColor] &rarr; Interpolate this into the SVG code to use the button text color of the [NcThemes.current] theme.
/// - [NcVectorImage.successColor] &rarr; Interpolate this into the SVG code to use the success color of the [NcThemes.current] theme.
/// - [NcVectorImage.warningColor] &rarr; Interpolate this into the SVG code to use the warning color of the [NcThemes.current] theme.
/// - [NcVectorImage.errorColor] &rarr; Interpolate this into the SVG code to use the error color of the [NcThemes.current] theme.
/// - [NcVectorImage.neutralColor] &rarr; Interpolate this into the SVG code to use the neutral color of the [NcThemes.current] theme.
class NcVectorImage extends StatelessWidget {
  /// Takes the given SVG [code] and interpolates the current theme colors into it.
  const NcVectorImage({Key? key, required this.code, this.width, this.height, this.alignment = Alignment.center}) : super(key: key);

  /// The SVG code to render.
  final String code;

  /// The width of the image.
  final double? width;

  /// The height of the image.
  final double? height;

  /// The alignment of the image.
  final Alignment alignment;

  /// Interpolate this into the SVG code to use the accent color of the [NcThemes.current] theme.
  static const accentColor = "{accentcolor}";

  /// Interpolate this into the SVG code to use the text color of the [NcThemes.current] theme.
  static const textColor = "{textcolor}";

  /// Interpolate this into the SVG code to use the secondary color of the [NcThemes.current] theme.
  static const secondaryColor = "{secondarycolor}";

  /// Interpolate this into the SVG code to use the primary color of the [NcThemes.current] theme.
  static const primaryColor = "{primarycolor}";

  /// Interpolate this into the SVG code to use the tertiary color of the [NcThemes.current] theme.
  static const tertiaryColor = "{tertiarycolor}";

  /// Interpolate this into the SVG code to use the error color of the [NcThemes.current] theme.
  static const errorColor = "{errorcolor}";

  /// Interpolate this into the SVG code to use the neutral color of the [NcThemes.current] theme.
  static const neutralColor = "{neutralcolor}";

  /// Interpolate this into the SVG code to use the warning color of the [NcThemes.current] theme.
  static const warningColor = "{warningcolor}";

  /// Interpolate this into the SVG code to use the success color of the [NcThemes.current] theme.
  static const successColor = "{successcolor}";

  /// Interpolate this into the SVG code to use the button text color of the [NcThemes.current] theme.
  static const buttonTextColor = "{buttonTextcolor}";

  /// Interpolates all the theme colors into the given [code].
  static String svg(String code) {
    code = code.replaceAll(accentColor, _toHex(NcThemes.current.accentColor))
      ..replaceAll(textColor, _toHex(NcThemes.current.textColor))
      ..replaceAll(secondaryColor, _toHex(NcThemes.current.secondaryColor))
      ..replaceAll(primaryColor, _toHex(NcThemes.current.primaryColor))
      ..replaceAll(tertiaryColor, _toHex(NcThemes.current.tertiaryColor))
      ..replaceAll(errorColor, _toHex(NcThemes.current.errorColor))
      ..replaceAll(warningColor, _toHex(NcThemes.current.warningColor))
      ..replaceAll(successColor, _toHex(NcThemes.current.successColor))
      ..replaceAll(buttonTextColor, _toHex(NcThemes.current.buttonTextColor));

    return code;
  }

  /// Converts the given [color] to a hex string.
  static String _toHex(Color color) => "#${color.value.toRadixString(16)}";

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      svg(code),
      width: width,
      height: height,
      alignment: alignment,
    );
  }
}
