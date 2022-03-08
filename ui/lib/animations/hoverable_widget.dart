part of animations;

/// Base class for all [HoverableWidget]s.
abstract class HoverableWidget extends StatefulWidget {
  const HoverableWidget({Key? key, required this.cursor}) : super(key: key);

  /// The cursor to use when the widget is hovered.
  final MouseCursor cursor;

  /// Override this method to build the widget based if the user [isHovering] or not.
  Widget build(BuildContext context, bool isHovering);

  @override
  State<HoverableWidget> createState() => _HoverableWidgetState();
}

class _HoverableWidgetState extends State<HoverableWidget> {
  bool _isHovering = false;

  _onEnter(_) {
    setState(() {
      _isHovering = true;
    });
  }

  _onExit(_) {
    setState(() {
      _isHovering = false;
    });
  }

  bool get isHovering => _isHovering;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: _onEnter,
      onExit: _onExit,
      child: widget.build(context, _isHovering),
    );
  }
}

const kDefaultHoverCursor = SystemMouseCursors.click;
