import 'package:crypto_coins_list/routes/router.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});
  static const String titleName = 'Crypto Currencies List';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: titleName, theme: darkTheme, routes: routes);
  }
}
