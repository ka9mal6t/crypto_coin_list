import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coin});

  final CryptoCoin coin;

  String _formatPrice(double price) {
    final value = price.toStringAsFixed(10);
    return value.replaceFirst(RegExp(r'\.?0+$'), '');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(
        coin.imageUrl,
        width: 40,
        height: 40,
        errorBuilder: (context, error, stackTrace) {
          return SvgPicture.asset(
            'assets/images/crypto_coin.svg',
            width: 40,
            height: 40,
          );
        },
      ),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text(
        '${_formatPrice(coin.price)}${coin.symbol}',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin);
      },
    );
  }
}
