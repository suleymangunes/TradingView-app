import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradingview_app/view/home/service/crypto/crypto_data_soure_with_dio.dart';
import 'package:tradingview_app/view/home/service/get-it/get_it_source.dart';
import 'package:tradingview_app/view/home/view-model/crypto_cubit.dart';
import 'package:tradingview_app/view/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CryptoCubit(cryptoDataSource: GetItSource.getIt<CryptoDataSourceWithDio>())..ranking(),
      child: const HomeView(),
    );
  }
}
