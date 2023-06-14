import 'package:flutter/material.dart';
import 'package:tradingview_app/core/constants/color/color_constant.dart';

class TitleMediumText extends StatelessWidget {
  const TitleMediumText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ProjectColors.white,
          ),
    );
  }
}
