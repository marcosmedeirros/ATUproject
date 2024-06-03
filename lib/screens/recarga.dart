import 'package:flutter/material.dart';
import 'package:telalogin/screens/carteira.dart';
import 'package:telalogin/screens/inicio.dart';
import 'package:telalogin/screens/mapa.dart';
import 'package:url_launcher/url_launcher.dart';

class Recarga extends StatefulWidget {
  @override
  _RecargaState createState() => _RecargaState();
}

class _RecargaState extends State<Recarga> {
  TextEditingController _valorController = TextEditingController();

  @override
  void dispose() {
    _valorController.dispose();
    super.dispose();
  }

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
                    controller: _valorController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Adicionar Saldo'),
                    enabled: false, // Campo desabilitado pq precisaria do banco
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: null, // Desativa o botão por causa do banco
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                  ),
                  child: Text(
                    'Adicionar',
                    style: TextStyle(color: Colors.white),
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
              onPressed: () async {
                const url = 'https://wa.link/bt06ds';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Não foi possível abrir o link $url';
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                padding: EdgeInsets.symmetric(horizontal: 40),
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
              child: Container(
                color: Colors.blue[900],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Inicio()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.directions_bus, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Mapa()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.account_balance_wallet, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Carteira()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.credit_card, color: Colors.white),
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
          ),
        ],
      ),
    );
  }
}
