import 'package:flutter/material.dart';
import 'package:tradingview_app/core/constants/color/color_constant.dart';

class LabelSmallText extends StatelessWidget {
  const LabelSmallText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: ProjectColors.manatee,
          ),
    );
  }
}
