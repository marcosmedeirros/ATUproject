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

  void adicionarViagem() {
    if (saldoConta >= 2.50) {
      setState(() {
        numeroViagens++;
        saldoConta -= 2.50;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saldo insuficiente para adicionar uma viagem.')),
      );
    }
  }

  void subtrairViagem() {
    if (numeroViagens > 0) {
      setState(() {
        numeroViagens--;
        saldoConta += 2.50;
      });
    }
  }

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
              child: Text('Sim', style: TextStyle(color: Colors.blue[900])),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar', style: TextStyle(color: Colors.blue[900])),
            ),
          ],
        );
      },
    );
  }

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
              height: 200,
              width: 150,
            ),
          ),
          // Título "Menu de Viagem"
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Menu de Viagem',
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                tileColor: Colors.blue[900],
                contentPadding: EdgeInsets.all(20),
                onTap: () {
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Card(
              color: Colors.blue[900],
              child: ListTile(
                title: const Text(
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
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: adicionarViagem,
                child: Text('Nova Viagem', style: TextStyle(fontSize: 24, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
              ElevatedButton(
                onPressed: subtrairViagem,
                child: Text('-', style: TextStyle(fontSize: 24, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: zerar,
                child: Text(
                  'Zerar',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.blue[900],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.white),
                      onPressed: () {
                        navigateToPage(Inicio());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.directions_bus, color: Colors.white),
                      onPressed: () {
                        navigateToPage(Mapa());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.account_balance_wallet, color: Colors.white),
                      onPressed: () {
                        navigateToPage(Carteira());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.credit_card, color: Colors.white),
                      onPressed: () {
                        navigateToPage(Recarga());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
