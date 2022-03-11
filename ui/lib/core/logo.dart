part of core;

/// Logo of [necodeIT](https://github.com/necodeIT), the creators of this [library](https://github.com/necodeIT/nekolib/tree/flutter).
class NcLogo extends StatelessWidget {
  NcLogo({Key? key, this.fontSize = 55, this.width, this.height, this.subtitleFontSize}) : super(key: key);

  /// The size of the logo.
  final double fontSize;

  /// The font size of the "―ねこで―" text. If not specified, it will be the difference between [fontSize] and [fonDiff].
  final double? subtitleFontSize;

  /// The width of the logo (only affects the cat).
  final double? width;

  /// The height of the logo (only affects the cat).
  final double? height;

  /// The difference used to calculate the font size of the "―ねこで―" part of the logo.
  static const double fontDiff = 26;

  /// The svg code of the cat.
  static const logoSvg = '''
  <svg xmlns="http://www.w3.org/2000/svg" width="134.165" height="137.907" viewBox="0 0 134.165 137.907">
    <g id="Cat" transform="translate(-894.224 -446.344)">
      <path id="Path_1" data-name="Path 1" d="M901.246,467.975l10.867,17-15.073,34.7v18.929l4.207,15.95-3.505,27.693,14.372-.7,8.764-18.754,5.959,18.754h99.554l-65.727-15.774v-38.56l-26.291-18.4s11.568-12.795,12.269-12.795,2.629-12.62,2.629-12.62l13.846-13.671h-9.64l-2.279-7.361-7.746,1.223-1.719-15.244-12.795,7.361-8.062-1.4Z" fill="none" stroke="${NcVectorImage.textColor}" stroke-linecap="round" stroke-linejoin="round" stroke-width="4"/>
      <path id="Path_2" data-name="Path 2" d="M928.939,455.706l14.894,7.864-8.233,2.3-34,2.1" fill="none" stroke="${NcVectorImage.textColor}" stroke-linecap="round" stroke-linejoin="bevel" stroke-width="4"/>
      <path id="Path_4" data-name="Path 4" d="M960.838,565.951v15.424" fill="none" stroke="${NcVectorImage.textColor}" stroke-linecap="round" stroke-width="4"/>
      <path id="Path_5" data-name="Path 5" d="M897.039,520.556l9.815-8.062,14.022,50.653" fill="none" stroke="${NcVectorImage.textColor}" stroke-linecap="round" stroke-linejoin="bevel" stroke-width="4"/>
      <path id="Path_6" data-name="Path 6" d="M907.03,512.494l13.145-16.125-8.437-11.995" fill="none" stroke="${NcVectorImage.textColor}" stroke-linecap="round" stroke-linejoin="bevel" stroke-width="4"/>
      <path id="Path_7" data-name="Path 7" d="M920.175,496.018H946.29" fill="none" stroke="${NcVectorImage.textColor}" stroke-linecap="round" stroke-width="4"/>
      <path id="Path_8" data-name="Path 8" d="M934.372,508.988l-14.2-12.094" fill="none" stroke="${NcVectorImage.textColor}" stroke-linecap="round" stroke-width="4"/>
      <path id="Path_9" data-name="Path 9" d="M949.445,483.4,936.3,471.48" fill="none" stroke="${NcVectorImage.textColor}" stroke-linecap="round" stroke-width="4"/>
      <path id="Path_10" data-name="Path 10" d="M953.282,469.768,936.31,471.55l-.334-5.483" fill="none" stroke="${NcVectorImage.textColor}" stroke-linecap="round" stroke-linejoin="bevel" stroke-width="4"/>
    </g>
  </svg>
  ''';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NcVectorImage(
          code: logoSvg,
          width: width,
          height: height,
        ),
        NcSpacing.medium(),
        Text(
          'necodeIT',
          style: GoogleFonts.orbitron(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
        Text(
          "―ねこで―",
          style: GoogleFonts.delaGothicOne(
            fontSize: fontSize - fontDiff,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
