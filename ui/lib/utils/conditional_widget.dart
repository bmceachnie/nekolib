part of utils;

/// Use this to conditionally swap between widgets.
class ConditionalWidget extends StatelessWidget {
  /// Constructs a new [ConditionalWidget] with the given [condition], [trueWidget] and [falseWidget].
  /// If [condition] is true, [trueWidget] will be used.
  /// If [condition] is false, [falseWidget] will be used.
  const ConditionalWidget({Key? key, required this.condition, required this.trueWidget, required this.falseWidget}) : super(key: key);

  /// The condition to check.
  final bool condition;

  /// The widget to show if the condition is true.
  final Widget trueWidget;

  /// The widget to show if the condition is false.
  final Widget falseWidget;

  @override
  Widget build(BuildContext context) => condition ? trueWidget : falseWidget;
}
