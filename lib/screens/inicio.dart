import 'package:flutter/material.dart';
import 'package:telalogin/screens/carteira.dart';
import 'package:telalogin/screens/recarga.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  // Função de navegação personalizada
  void navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Logo
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/images/logobus.png',
              height: 250,
              width: 200,
            ),
          ),
          // Menu de Viagens
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Card(
              color: Colors.blue[900],
              child: ListTile(
                title: Text(
                  'Valor em Conta',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  'R\$ 100,00',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                tileColor: Colors.blue[900],
                contentPadding: EdgeInsets.all(20),
                onTap: () {
                  // Ação ao tocar no card
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Card(
              color: Colors.blue[900],
              child: ListTile(
                title: Text(
                  'Número de Viagens',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  '10',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                tileColor: Colors.blue[900],
                contentPadding: EdgeInsets.all(20),
                onTap: () {
                  // Ação ao tocar no card
                },
              ),
            ),
          ),
          // Menu Inferior
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Inicio()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.directions_bus),
                    onPressed: () {
                      // Navegar para a página Linhas de Ônibus
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.account_balance_wallet),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Carteira()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.credit_card),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Recarga()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
