import 'package:crypto_coins_list/crypto_coins_list_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'repositories/crypto_coins/crypto_coins.dart';

void main() {
  GetIt.instance.registerSingleton<Dio>(Dio());
  GetIt.instance.registerSingleton<AbstractCoinsRepository>(
    CryptoCoinsRepository(dio: GetIt.instance.get<Dio>()),
  );
  runApp(const CryptoCurrenciesListApp());
}
