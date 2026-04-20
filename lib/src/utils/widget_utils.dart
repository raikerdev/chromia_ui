import 'package:flutter/material.dart';

extension WidgetUtils on Widget {
  Widget wrapWithOnTap(VoidCallback? onTap) {
    return onTap != null
        ? MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onTap,
              child: this,
            ),
          )
        : this;
  }
}
