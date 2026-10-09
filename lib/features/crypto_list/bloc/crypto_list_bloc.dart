import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repositories/crypto_coins/crypto_coins.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoListEvent>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final cryptoList = await coinsRepository.getCoinsList(
          currencies: event.currency,
        );
        emit(CryptoListLoaded(coinsList: cryptoList));
      } catch (e) {
        emit(CryptoListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
