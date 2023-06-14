import 'package:tradingview_app/view/home/model/crypto.dart';
import 'package:tradingview_app/view/home/service/crypto/icrypto_data_source.dart';

class CryptoRepository {
  final ICryptoDataSource cryptoDataSource;
  CryptoRepository(this.cryptoDataSource);

  Future<List<Crypto>> getProducts() async {
    return await cryptoDataSource.fetchData();
  }
}
