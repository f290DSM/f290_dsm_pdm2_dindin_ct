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
                leading: const Icon(FontAwesomeIcons.moneyBill),
                title: const Text('Cotação de Moedas'),
                onTap: (){
                  //TODO: Realizar navegação entre telas
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              child: ListTile(
                leading: const Icon(FontAwesomeIcons.cloud),
                title: const Text('Previsão do Tempo'),
                onTap: (){
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
