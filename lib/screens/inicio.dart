import 'package:flutter/material.dart';
import 'package:telalogin/screens/carteira.dart';
import 'package:telalogin/screens/mapa.dart';
import 'package:telalogin/screens/recarga.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  double saldoConta = 100.0;
  int numeroViagens = 10;

  // Função para adicionar uma viagem e subtrair o saldo
  void adicionarViagem() {
    setState(() {
      numeroViagens++;
      saldoConta -= 2.50;
    });
  }

  // Função para subtrair uma viagem e adicionar ao saldo
  void subtrairViagem() {
    if (numeroViagens > 0) {
      setState(() {
        numeroViagens--;
        saldoConta += 2.50;
      });
    }
  }

  // Função para zerar o saldo e o número de viagens
  void zerar() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Você tem certeza?'),
          content: Text('Isso irá zerar seu saldo e número de viagens.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  saldoConta = 0;
                  numeroViagens = 0;
                });
                Navigator.of(context).pop();
              },
              child: Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  // Função de navegação personalizada
  void navigateToPage(Widget page) async {
    if (page.runtimeType == Recarga) {
      final valorRecarga = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
      if (valorRecarga != null) {
        adicionarSaldo(valorRecarga);
      }
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    }
  }

  // Função para atualizar o saldo da conta com o valor da recarga
  void adicionarSaldo(double valorRecarga) {
    setState(() {
      saldoConta += valorRecarga;
    });
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
            padding: const EdgeInsets.all(1),
            child: Image.asset(
              'assets/images/logobus.png',
              height: 300,
              width: 350,
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
                  'R\$ ${saldoConta.toStringAsFixed(2)}',
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
                  numeroViagens.toString(),
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
          // Botões para adicionar e subtrair viagens
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: adicionarViagem,
                child: Text('+', style: TextStyle(fontSize: 24)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Mudando para verde
                ),
              ),
              ElevatedButton(
                onPressed: subtrairViagem,
                child: Text('-', style: TextStyle(fontSize: 24)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Mudando para vermelho
                ),
              ),
              ElevatedButton(
                onPressed: zerar,
                child: Text(
                  'Zerar',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], // Mudado para azul(900)
                ),
              ),
            ],
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
                      navigateToPage(Inicio());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.directions_bus),
                    onPressed: () {
                      navigateToPage(Mapa());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.account_balance_wallet),
                    onPressed: () {
                      navigateToPage(Carteira());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.credit_card),
                    onPressed: () {
                      navigateToPage(Recarga());
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
