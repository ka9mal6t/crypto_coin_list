part of 'crypto_list_bloc.dart';

abstract class CryptoListEvent extends Equatable {}

class LoadCryptoListEvent extends CryptoListEvent {
  LoadCryptoListEvent({this.currency = 'usd', this.completer});

  final String currency;
  final Completer? completer;

  @override
  List<Object?> get props => [currency, completer];
}
