import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';

class CurrencyService {

  final hgBrasilFinanceUrl = 'https://api.hgbrasil.com/finance?key=90230925';

  getData() async {
    var response = await get(Uri.parse(hgBrasilFinanceUrl));

    if(response.statusCode == HttpStatus.ok) {
      return response.body;
    }

    log('Falha na requisição. Code: ${response.statusCode}. Data: ${response.body}');

    throw Exception('Falha ao consultar a API HGBrasil.');
  }
}