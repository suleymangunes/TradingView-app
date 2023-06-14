import 'package:flutter/material.dart';
import 'package:tradingview_app/core/constants/color/color_constant.dart';
import 'package:tradingview_app/core/enum/project_icon.dart';
import 'package:tradingview_app/product/init/locale/project_keys.dart';
import 'package:tradingview_app/view/home/model/crypto.dart';

class TradingView extends StatelessWidget {
  const TradingView({super.key, required this.crypto});
  final Crypto crypto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TradingAppBar(crypto: crypto),
    );
  }
}

class TradingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TradingAppBar({
    super.key,
    required this.crypto,
  });
  final Crypto crypto;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const AppBarBackIconButton(),
      title: Column(
        children: [
          TitleMediumText(text: crypto.symbol.toString()),
          const LabelSmallText(text: ProjectKeys.globalAverage),
        ],
      ),
      actions: const [
        AppBarNotificationIconButton(),
        AppBarStarIconButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

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

class AppBarBackIconButton extends StatelessWidget {
  const AppBarBackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        ProjectIcons.back.getIconData,
        color: ProjectColors.white,
      ),
    );
  }
}

class AppBarNotificationIconButton extends StatelessWidget {
  const AppBarNotificationIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        ProjectIcons.notification.getIconData,
        color: ProjectColors.white,
      ),
    );
  }
}

class AppBarStarIconButton extends StatelessWidget {
  const AppBarStarIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        ProjectIcons.star.getIconData,
        color: ProjectColors.dolly,
      ),
    );
  }
}
