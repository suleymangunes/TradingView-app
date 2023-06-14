// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tradingview_app/core/constants/color/color_constant.dart';
import 'package:tradingview_app/core/extension/context_extension.dart';
import 'package:tradingview_app/product/init/locale/project_keys.dart';
import 'package:tradingview_app/view/tradingview/service/crypto_name_data_source.dart';
import 'package:tradingview_app/view/tradingview/service/trading_view_html.dart';

import 'package:tradingview_app/product/widget/divider/medium_full_width_divider.dart';
import 'package:tradingview_app/view/_product/tabbar/trading_tabbar_constants.dart';
import 'package:tradingview_app/view/_product/tabbar/trading_view_tabbars.dart';
import 'package:tradingview_app/view/_product/widget/appbar/tradingview_app_bar.dart';
import 'package:tradingview_app/view/home/model/crypto.dart';

class TradingView extends StatelessWidget {
  const TradingView({super.key, required this.crypto});
  final Crypto crypto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TradingAppBar(crypto: crypto),
      body: DefaultTabController(
        length: TabbarConstants.tabbarItems.length,
        child: SingleChildScrollView(
          child: SizedBox(
            height: context.bodyHeight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TradingviewTabbars(),
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: context.tradingViewWidgetHeight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: TradingViewWidgetHtml(
                                  cryptoName: CryptoNameDataSource.binanceSourceEuro(crypto.symbol.toString())),
                            ),
                          ),
                          const MediumFullWidthDivider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              CurrencyConversion().convertUsdToEuro(crypto.quote!.uSD!.price!),
                                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: ProjectColors.cabaret,
                                                  ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                ProjectKeys.eur,
                                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                                      fontWeight: FontWeight.w400,
                                                      color: ProjectColors.cabaret,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            LabelSmallTextManatee(
                                                text:
                                                    "= ${crypto.quote!.uSD!.price!.toStringAsFixed(2)} ${ProjectKeys.usd} "),
                                            Text("${crypto.quote!.uSD!.percentChange24h!.toStringAsFixed(2)}%",
                                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                                      color: ProjectColors.cabaret,
                                                    ))
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ProjectColors.marinique,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            isDense: true,
                                            padding: EdgeInsets.zero,
                                            value: ProjectKeys.globalAverage,
                                            iconEnabledColor: ProjectColors.white,
                                            borderRadius: BorderRadius.circular(20),
                                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: ProjectColors.spoonBearl,
                                                ),
                                            items: const [
                                              DropdownMenuItem(
                                                value: ProjectKeys.globalAverage,
                                                child: Text(ProjectKeys.globalAverage),
                                              ),
                                              DropdownMenuItem(
                                                value: ProjectKeys.appName,
                                                child: Text(ProjectKeys.appName),
                                              )
                                            ],
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    context.smallHeightSize,
                                    Row(
                                      children: [
                                        CustomMultiTextArea(
                                          title: ProjectKeys.twentyFourHourHighEuro,
                                          description: crypto.quote!.uSD!.percentChange24h!.toStringAsFixed(2),
                                        ),
                                        const Spacer(),
                                        CustomMultiTextArea(
                                          title: ProjectKeys.twentyFourHourLowEuro,
                                          description: crypto.quote!.uSD!.percentChange30d!.toStringAsFixed(2),
                                        ),
                                        const Spacer(),
                                        CustomMultiTextArea(
                                          title: ProjectKeys.twentyFourVol,
                                          description: crypto.quote!.uSD!.price!.toStringAsFixed(2),
                                        ),
                                      ],
                                    ),
                                    context.smallHeightSize,
                                    Row(
                                      children: [
                                        CustomMultiTextArea(
                                          title: ProjectKeys.cap,
                                          description: crypto.quote!.uSD!.marketCap!.toStringAsFixed(2),
                                        ),
                                        const Spacer(),
                                        CustomMultiTextArea(
                                          title: ProjectKeys.circulation(crypto.symbol.toString()),
                                          description: crypto.quote!.uSD!.marketCapDominance!.toStringAsFixed(2),
                                        ),
                                        const Spacer(),
                                        const CustomMultiTextSize(),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Card(
                        color: Colors.green,
                      ),
                      const Card(
                        color: Colors.yellow,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomMultiTextSize extends StatelessWidget {
  const CustomMultiTextSize({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.multiTextHeight,
      width: context.quarterWidth,
    );
  }
}

class CustomMultiTextArea extends StatelessWidget {
  const CustomMultiTextArea({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.multiTextHeight,
      width: context.quarterWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedSmallLabetTextManatee(text: title),
          FittedMediumLabelTextManatee(text: description),
        ],
      ),
    );
  }
}

class CurrencyConversion {
  String convertUsdToEuro(num usdValue) {
    final eurResult = usdValue * 1.09;
    return eurResult.toStringAsFixed(2);
  }
}

class FittedMediumLabelTextManatee extends StatelessWidget {
  const FittedMediumLabelTextManatee({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: LabelMediumTextManatee(
      text: text,
    ));
  }
}

class LabelMediumTextManatee extends StatelessWidget {
  const LabelMediumTextManatee({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: ProjectColors.white,
            fontWeight: FontWeight.w700,
          ),
    );
  }
}

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

class LabelSmallTextManatee extends StatelessWidget {
  const LabelSmallTextManatee({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: ProjectColors.manatee,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}
