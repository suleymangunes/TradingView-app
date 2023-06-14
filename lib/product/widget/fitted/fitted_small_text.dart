import 'package:flutter/material.dart';
import 'package:tradingview_app/core/component/text/label_small_text_manatee.dart';

class FittedSmallLabetTextManatee extends StatelessWidget {
  const FittedSmallLabetTextManatee({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: LabelSmallTextManatee(text: text),
    );
  }
}
