import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.symbol,
  });

  final String name;
  final double price;
  final String imageUrl;
  final String symbol;

  @override
  List<Object?> get props => [name, price, imageUrl, symbol];
}
