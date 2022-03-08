part of animations;

/// A builder to adapt to the widget being hoverd or not.
class HoverBuilder extends _HoverableWidget {
  const HoverBuilder({Key? key, required this.builder, MouseCursor cursor = kDefaultHoverCursor}) : super(key: key, cursor: cursor);

  /// The builder to build the widget based if the user [isHovering] or not.
  final Widget Function(BuildContext context, bool isHovering) builder;

  @override
  Widget build(BuildContext context, bool isHovering) => builder(context, isHovering);
}
