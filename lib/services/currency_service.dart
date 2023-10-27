import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:f290_dsm_pdm2_dindin_ct/domain/currency_model.dart';
import 'package:http/http.dart';

class CurrencyService {
  final hgBrasilFinanceUrl = 'https://api.hgbrasil.com/finance?key=90230925';

  final currenciesIdentification = [
    'USD',
    'EUR',
    'GBP',
    'ARS',
    'CAD',
    'AUD',
    'JPY',
    'CNY',
    'BTC'
  ];

  Future<String> getData() async {
    var response = await get(Uri.parse(hgBrasilFinanceUrl));

    if (response.statusCode == HttpStatus.ok) {
      return response.body;
    }

    log('Falha na requisição. Code: ${response.statusCode}. Data: ${response.body}');

    throw Exception('Falha ao consultar a API HGBrasil.');
  }

  Future<List<CurrencyModel>> getCurrencies() async {
    var data = await getData();
    var json = jsonDecode(data);
    var map = json['results']['currencies'];

    return currenciesIdentification.map((id) =>
        CurrencyModel.fromMap(map[id])).toList();
  }
}
