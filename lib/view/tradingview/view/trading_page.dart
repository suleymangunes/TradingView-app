import 'package:flutter/material.dart';
import 'package:tradingview_app/view/home/model/crypto.dart';
import 'package:tradingview_app/view/tradingview/view/trading_view.dart';

class TradingPage extends StatelessWidget {
  const TradingPage({super.key, required this.crypto});
  final Crypto crypto;

  @override
  Widget build(BuildContext context) {
    return TradingView(
      crypto: crypto,
    );
  }
}
