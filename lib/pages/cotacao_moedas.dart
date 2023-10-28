import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../domain/currency_model.dart';
import '../services/currency_service.dart';

class CotacaoMoedasPage extends StatefulWidget {
  const CotacaoMoedasPage({super.key, required this.title});

  final String title;

  @override
  State<CotacaoMoedasPage> createState() => _CotacaoMoedasPageState();
}

class _CotacaoMoedasPageState extends State<CotacaoMoedasPage> {
  final currencyService = CurrencyService();

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  _fetchData() async {
    var service = CurrencyService();
    List<CurrencyModel> currencies = await service.getCurrencies();
    log(currencies.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: currencyService.getCurrencies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: LoadingIndicator(indicatorType: Indicator.pacman),
              ),
            );
          }

          //TODO: Validar erros da requisicao
          if (snapshot.hasError) {
            return const Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Icon(
                  Icons.error,
                  size: 175,
                ),
              ),
            );
          }

          // Paula, Paulo, Antonio, Joyce, Marius, Jonatan, Bruna, Gleison

          List<CurrencyModel> currencies = snapshot.data!;

          return ListView.builder(
            itemCount: currencies.length,
            itemBuilder: (context, index) {
              var currency = currencies[index];
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(currency.name!),
                      subtitle: Text('${currency.sell}'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}