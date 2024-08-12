import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _imagemApp = const AssetImage("images/padrao.png");
  var _imagemUser = const AssetImage("images/padrao.png");
  var _imagemLula = const AssetImage("images/lula.jpg");
  var _imagemBonoro = const AssetImage("images/bonoro.png");

  var _mensagem = "Escolha uma opção camarada";
  var _userWin = 0;
  var _appWin = 0;
  var _empate = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = const AssetImage("images/tesoura.png");
        });
    }

    switch (escolhaUsuario) {
      case "pedra":
        setState(() {
          _imagemUser = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemUser = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemUser = const AssetImage("images/tesoura.png");
        });
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _mensagem = "Parabéns!!! Você ganhou :)";
        _imagemUser = _imagemBonoro;
        _userWin += 1;
      });
    } else if (escolhaUsuario == escolhaApp) {
      setState(() {
        _mensagem = "Empatamos ;)";
        _empate += 1;
      });
    } else {
      setState(() {
        _mensagem = "Você perdeu :(";
        _imagemApp = _imagemLula;
        _appWin += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
        backgroundColor: Colors.black26,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Pedra, papel, tesoura",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Image(image: _imagemUser),
              ),
              const Text('VS',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              Expanded(
                child: Image(image: _imagemApp),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset("images/pedra.png", height: 80),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset("images/papel.png", height: 80),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset("images/tesoura.png", height: 80),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  "Você: $_userWin",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  "App: $_appWin",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  "Empate: $_empate",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
