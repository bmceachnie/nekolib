part of animations;

class ScaleOnHover extends HoverableWidget {
  ScaleOnHover({Key? key, required this.child, MouseCursor cursor = SystemMouseCursors.click}) : super(key: key, cursor: cursor);

  final Widget child;

  @override
  Widget build(BuildContext context, bool isHovering) {
    return Container(
      color: isHovering ? Colors.red : Colors.blue,
      child: child,
    );
  }
}
