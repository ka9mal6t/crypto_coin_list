// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'crypto_coins.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList({String currencies = 'usd'}) async {
    final response = await dio.get(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currencies',
    );

    final data = response.data as List<dynamic>;
    final coinsList = data.map((item) {
      final map = item as Map<String, dynamic>;

      return CryptoCoin(
        name: map['name'] as String,
        price: (map['current_price'] as num).toDouble(),
        imageUrl: map['image'] as String,
        symbol: currencies == 'usd'
            ? '\$'
            : currencies == 'eur'
            ? '€'
            : currencies == 'gbp'
            ? '£'
            : currencies == 'jpy'
            ? '¥'
            : currencies == 'inr'
            ? '₹'
            : currencies == 'pln'
            ? 'zł'
            : '',
      );
    }).toList();

    return coinsList;
  }
}
