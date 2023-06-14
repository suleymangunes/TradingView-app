import 'package:flutter/material.dart';
import 'package:tradingview_app/core/constants/color/color_constant.dart';
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
      body: Column(
        children: [
          DefaultTabController(
            length: TabbarConstants.tabbarItems.length,
            child: Column(
              children: [
                const TradingviewTabbars(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: const TabBarView(
                    children: [
                      Card(
                        color: Colors.red,
                      ),
                      Card(
                        color: Colors.green,
                      ),
                      Card(
                        color: Colors.yellow,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: ProjectColors.haitiDark,
            height: 8,
            thickness: 4,
          )
        ],
      ),
    );
  }
}
