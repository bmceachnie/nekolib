import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcDialog extends StatelessWidget {
  NcDialog({Key? key, this.title = "", required this.body, this.confirmText = "Confirm", this.cancelText = "Cancel", required this.onConfirm, this.onCancel, this.label, this.buttonWidth = defaultButtonWidth}) : super(key: key) {
    confirmOnly = false;
  }
  NcDialog.ok({Key? key, required this.title, required this.body, this.onConfirm, this.confirmText = "OK", this.label, this.buttonWidth = defaultButtonWidth}) : super(key: key) {
    confirmOnly = true;
  }

  final String title;
  final Widget? label;
  final Widget body;
  final String confirmText;
  final double buttonWidth;
  late final String? cancelText;
  late final bool confirmOnly;

  final Function()? onConfirm;
  late final Function()? onCancel;

  static const double padding = 20;
  static const double widthFactor = .5;
  static const double heightFactor = .8;
  static const double defaultButtonWidth = 100;
  static const Duration duration = Duration(milliseconds: 400);

  static Widget transition(Widget dialog, Animation<double> animation) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut),
      child: FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut),
        child: dialog,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (title.isEmpty && label == null) throw ArgumentError("Please define either a label or a title!");

    return AlertDialog(
      title: label ?? NcTitleText(title, fontSize: 30),
      titlePadding: EdgeInsets.all(padding),
      buttonPadding: EdgeInsets.only(left: padding, right: padding),
      contentPadding: EdgeInsets.only(bottom: padding, left: padding, right: padding),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * widthFactor,
          maxHeight: MediaQuery.of(context).size.height * heightFactor,
          maxWidth: MediaQuery.of(context).size.width * widthFactor,
        ),
        child: body,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (!confirmOnly) NcButton.cancel(text: cancelText ?? "", onTap: onCancel ?? Navigator.of(context).pop, width: buttonWidth),
            NcSpacing.medium(),
            NcButton(text: confirmText, onTap: onConfirm ?? Navigator.of(context).pop, width: buttonWidth),
          ],
        )
      ],
      backgroundColor: NcThemes.current.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(ncRadius)),
      ),
    );
  }
}

void showNcDialog(
  BuildContext context, {
  String title = "",
  required Widget body,
  String confirmText = "Confirm",
  String cancelText = "Cancel",
   Function()? onConfirm,
  Function()? onCancel,
  Widget? label,
  double buttonWidth = NcDialog.defaultButtonWidth,
}) {
  var dialog = NcDialog(
    title: title,
    body: body,
    confirmText: confirmText,
    cancelText: cancelText,
    onConfirm: onConfirm,
    onCancel: onCancel,
    label: label,
    buttonWidth: buttonWidth,
  );

  showGeneralDialog(
    context: context,
    transitionDuration: NcDialog.duration,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (_, __, ___) => Container(),
    transitionBuilder: (context, animation, _, widget) => NcDialog.transition(dialog, animation),
  );
}

void showNcDialogOK(
  BuildContext context, {
  String title = "",
  required Widget body,
  String confirmText = "Confirm",
  Function()? onConfirm,
  Widget? label,
  double buttonWidth = NcDialog.defaultButtonWidth,
}) {
  var dialog = NcDialog.ok(
    title: title,
    body: body,
    confirmText: confirmText,
    onConfirm: onConfirm,
    label: label,
    buttonWidth: buttonWidth,
  );

  showGeneralDialog(
    context: context,
    transitionDuration: NcDialog.duration,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (_, __, ___) => Container(),
    transitionBuilder: (context, animation, _, widget) => NcDialog.transition(dialog, animation),
  );
}
