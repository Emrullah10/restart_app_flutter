import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Single Material 3 widget tree everywhere, with a thin per-platform skin
/// at the handful of spots where "native-feeling" actually matters
/// (back affordance, switches, action sheets, loading spinners, haptics).
/// This mirrors the Stitch layouts exactly — it does not fork the layout.
class Adaptive {
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  /// Back icon: chevron on iOS, arrow on Android.
  static IconData get backIcon =>
      isIOS ? CupertinoIcons.chevron_back : Icons.arrow_back_rounded;

  /// A themed switch: CupertinoSwitch on iOS, Material Switch elsewhere.
  static Widget switchControl({
    required bool value,
    required ValueChanged<bool> onChanged,
    required Color activeColor,
  }) {
    if (isIOS) {
      return CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: activeColor,
      );
    }
    return Switch(value: value, onChanged: onChanged);
  }

  /// A themed activity indicator.
  static Widget activityIndicator({Color? color}) {
    if (isIOS) {
      return CupertinoActivityIndicator(color: color);
    }
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(strokeWidth: 2, color: color),
    );
  }

  /// A themed action sheet with a list of labeled actions.
  /// Returns the index of the chosen action, or null if dismissed.
  static Future<int?> showActionSheet({
    required BuildContext context,
    required String title,
    required List<String> actions,
    String cancelLabel = 'İptal',
  }) {
    if (isIOS) {
      return showCupertinoModalPopup<int>(
        context: context,
        builder: (ctx) => CupertinoActionSheet(
          title: Text(title),
          actions: [
            for (var i = 0; i < actions.length; i++)
              CupertinoActionSheetAction(
                onPressed: () => Navigator.of(ctx).pop(i),
                child: Text(actions[i]),
              ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(cancelLabel),
          ),
        ),
      );
    }
    return showModalBottomSheet<int>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < actions.length; i++)
              ListTile(
                title: Text(actions[i]),
                onTap: () => Navigator.of(ctx).pop(i),
              ),
          ],
        ),
      ),
    );
  }

  /// Selection haptic — used on tab switches and similar discrete choices.
  static void selectionClick() => HapticFeedback.selectionClick();
}
