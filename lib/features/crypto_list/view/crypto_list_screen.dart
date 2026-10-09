import 'dart:async';

import 'package:crypto_coins_list/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/crypto_list_bloc.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  final String title = 'Crypto Currencies List';

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  String selectedCurrency = 'usd';
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  initState() {
    _cryptoListBloc.add(LoadCryptoListEvent(currency: selectedCurrency));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: DropdownButton<String>(
              value: selectedCurrency,
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(value: 'usd', child: Text('USD')),
                DropdownMenuItem(value: 'eur', child: Text('EUR')),
                DropdownMenuItem(value: 'pln', child: Text('PLN')),
                DropdownMenuItem(value: 'gbp', child: Text('GBP')),
                DropdownMenuItem(value: 'jpy', child: Text('JPY')),
                DropdownMenuItem(value: 'inr', child: Text('INR')),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  selectedCurrency = value;
                });
                _cryptoListBloc.add(
                  LoadCryptoListEvent(currency: selectedCurrency),
                );
              },
            ),
          ),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(
            LoadCryptoListEvent(
              currency: selectedCurrency,
              completer: completer,
            ),
          );
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                itemBuilder: (context, i) {
                  final coin = state.coinsList[i];
                  return CryptoCoinTile(coin: coin);
                },
                separatorBuilder: (context, i) =>
                    const Divider(color: Colors.white24, height: 1),
              );
            }
            if (state is CryptoListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: theme.textTheme.headlineMedium,
                    ),
                    Text(
                      'Please try againg later',
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        _cryptoListBloc.add(
                          LoadCryptoListEvent(currency: selectedCurrency),
                        );
                      },
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator.adaptive());
          },
        ),
      ),
    );
  }
}
