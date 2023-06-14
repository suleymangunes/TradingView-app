// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tradingview_app/core/extension/context_extension.dart';
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
                            child: TradingViewWidgetHtml(
                                cryptoName: CryptoNameDataSource.binanceSourceEuro(crypto.symbol.toString())),
                          ),
                          const MediumFullWidthDivider(),
                          const Text("data"),
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
