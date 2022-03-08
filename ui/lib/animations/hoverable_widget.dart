part of animations;

abstract class HoverableWidget extends StatefulWidget {
  HoverableWidget({Key? key, required this.cursor}) : super(key: key);

  final MouseCursor cursor;

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
