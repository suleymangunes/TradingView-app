import 'package:flutter/material.dart';
import 'package:tradingview_app/view/home/service/icon-service/get_icon_from_network.dart';

class CryptoIcon extends StatelessWidget {
  const CryptoIcon({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Image.network(
        IconNetwork().getIconToNetwork(url),
      ),
    );
  }
}
