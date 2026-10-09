# Crypto Coins List

A Flutter app for browsing cryptocurrency market prices. The app loads coin
names, prices, symbols, and icons from the CoinGecko markets API and lets you
switch the displayed fiat currency.

## Features

- Browse cryptocurrency prices and coin icons.
- Refresh the market list with pull-to-refresh.
- Choose USD, EUR, GBP, JPY, INR, or PLN as the quote currency.
- Open a detail screen for a coin.
- Run on the Flutter platforms configured in this repository.

## Requirements

- Flutter SDK with Dart 3.13.0 or later.
- A device, emulator, or desktop target configured for Flutter.
- Internet access to retrieve market data from CoinGecko.

Check your local Flutter setup with:

```sh
flutter doctor
```

## Run

From the project root, install dependencies and start the app:

```sh
flutter pub get
flutter run
```

To select a specific connected device, first run `flutter devices`, then pass
its identifier to `flutter run -d <device-id>`.

## Tests and analysis

```sh
flutter analyze
flutter test
```

## Data source

Market data is requested from the
[CoinGecko coins markets endpoint](https://docs.coingecko.com/reference/coins-markets).
The app currently makes unauthenticated requests, so availability and request
limits are subject to CoinGecko's API policies.

## Project layout

```text
lib/
	features/       List and coin detail screens, widgets, and BLoC
	repositories/   Coin market API and data model
	routes/         App navigation
	theme/          Material theme
assets/           App assets
```

## License

This project is open source under the [MIT License](LICENSE).
