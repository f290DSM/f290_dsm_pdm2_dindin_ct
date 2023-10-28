import 'package:f290_dsm_pdm2_dindin_ct/pages/cotacao_moedas.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HGBrasil'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: ListView(
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              child: ListTile(
                leading: const Icon(
                  FontAwesomeIcons.moneyBill,
                  size: 64,
                ),
                title: const Text('Cotação de Moedas'),
                subtitle: const Text(
                    'Consulta sobre os valores de compra, venda e variação da principais moedas.'),
                onTap: () {
                  //TODO: Realizar navegação entre telas
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CotacaoMoedasPage(title: 'Cotações HGBrasil'),
                    ),
                  );
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              child: ListTile(
                leading: const Icon(
                  FontAwesomeIcons.cloudRain,
                  size: 64,
                ),
                title: const Text('Previsão do Tempo'),
                subtitle: const Text(
                    'Consulta da previsão do tempo atual e para os próximos 10 dias.'),
                onTap: () {
                  //TODO: Realizar navegação entre telas
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              child: ListTile(
                leading: const Icon(
                  FontAwesomeIcons.calculator,
                  size: 64,
                ),
                title: const Text('Calculadora'),
                subtitle: const Text('Calculadora para conversão de moedas.'),
                onTap: () {
                  //TODO: Realizar navegação entre telas
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
