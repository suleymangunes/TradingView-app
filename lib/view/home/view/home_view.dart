import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradingview_app/core/enum/base_status.dart';
import 'package:tradingview_app/view/home/model/crypto.dart';
import 'package:tradingview_app/view/home/view-model/crypto_cubit.dart';
import 'package:tradingview_app/view/home/view-model/crypto_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CryptoCubit, CryptoState>(
        builder: (context, state) {
          switch (state.status) {
            case BaseStatus.initial:
              return const SizedBox.shrink();
            case BaseStatus.loading:
              return const CircularProgressIndicator();
            case BaseStatus.completed:
              return _listCrypto(state as CryptoCompleted);
            case BaseStatus.error:
              return _error(context);
          }
        },
      ),
    );
  }

  TextButton _tryAgainButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<CryptoCubit>().ranking();
      },
      // child: const TextBodyMedium(text: ProjectStrings.tryAgain),
      child: const Text("tekrar dene"),
    );
  }

  ListView _listCrypto(CryptoCompleted state) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: state.response.length,
      itemBuilder: (BuildContext context, int index) {
        final model = state.response[index];
        if (model != null && model is Crypto) {
          // return CryptoCard(
          //   id: (index + 1).toString(),
          //   price: model.quote?.uSD?.price?.toStringAsFixed(2) ?? 'x',
          //   name: model.name.toString(),
          //   change: model.quote?.uSD?.percentChange1h.toString()[0] ?? 'x',
          // );
          return const Text("data");
        }
        return const SizedBox.shrink();
      },
    );
  }

  Center _error(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("hata olsu"),
          // const ErrorcIcon(),
          // context.normalSizedBox,
          // const TextBodyMedium(text: ProjectStrings.error),
          _tryAgainButton(context),
        ],
      ),
    );
  }
}
