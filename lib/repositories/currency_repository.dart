import 'package:cryptocurrency/models/currency_model.dart';

class CurrencyRepository {
  static final List<Currency> currencies = [
    Currency(
      icone: "assets/img/binance-coin-cryptocurrency.png",
      name: "Binance Coin",
      sigla: "Bnb",
      price: 482461.83,
    ),
    Currency(
      icone: "assets/img/bitcoin-cryptocurrency.png",
      name: "Bitcoin",
      sigla: "BTC",
      price: 58280302.20,
    ),
    Currency(
      icone: "assets/img/cardano-cryptocurrency.png",
      name: "Cardano",
      sigla: "ADA",
      price: 538.38,
    ),
    Currency(
      icone: "assets/img/cosmos-cryptocurrency.png",
      name: "Cosmos",
      sigla: "ATOM",
      price: 11457.56,
    ),
    Currency(
      icone: "assets/img/dogecoin-cryptocurrency.png",
      name: "Dogecoin",
      sigla: "DOGE",
      price: 150.82,
    ),
  ];
}
