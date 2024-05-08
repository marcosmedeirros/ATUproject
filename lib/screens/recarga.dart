import 'package:flutter/material.dart';
import 'package:telalogin/screens/carteira.dart';
import 'package:telalogin/screens/inicio.dart';

class Recarga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recarga'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Adicionar Saldo'),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Adicionar a lógica para adicionar saldo aqui
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Saldo adicionado com sucesso!'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900], // Define a cor de fundo como Azul(900)
                  ),
                  child: Text(
                    'Adicionar',
                    style: TextStyle(color: Colors.white), // Define a cor do texto como branco
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            'assets/images/pagamento.png',
            height: 200,
            width: 200,
          ),
          SizedBox(height: 20),
          Text(
            'Clique no botão abaixo e envie o comprovante do pagamento, foto da carteirinha e o CPF do titular do Cartão a ser carregado',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Adicionar a lógica para recarregar aqui
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900], // Define a cor de fundo como Azul(900)
                padding: EdgeInsets.symmetric(horizontal: 40), // Adiciona uma margem horizontal
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Recarregar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
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
