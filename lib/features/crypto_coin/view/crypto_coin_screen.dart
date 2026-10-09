import 'package:flutter/material.dart';

import '../../../repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinsScreen extends StatefulWidget {
  const CryptoCoinsScreen({super.key});

  @override
  State<CryptoCoinsScreen> createState() => _CryptoCoinsScreenState();
}

class _CryptoCoinsScreenState extends State<CryptoCoinsScreen> {
  CryptoCoin? coin;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is CryptoCoin) {
      coin = args;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(coin?.name ?? 'Unknown Coin')),
      body: coin == null
          ? const Center(child: Text('Coin not found'))
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Image.network(
                      coin?.imageUrl ?? '',
                      width: 200,
                      height: 200,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.currency_bitcoin),
                    ),
                  ),
                  Text(
                    coin?.name ?? 'Unknown Coin',
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    '${coin?.price} ${coin?.symbol}',
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
    );
  }
}
