import 'package:flutter/material.dart';

extension ProjedtPads on BuildContext {
  EdgeInsets get labelPad => const EdgeInsets.all(15);
  EdgeInsets get indicatorPad => const EdgeInsets.only(bottom: 3);
}

extension ScreenSize on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get paddingTop => MediaQuery.of(this).padding.top;
}

extension SizeByScreen on BuildContext {
  double get bodyHeight => height - (paddingTop + kToolbarHeight);
  double get tradingViewWidgetHeight => height * 0.6;
}
