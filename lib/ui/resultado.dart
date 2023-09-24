import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String _imagem;
  final String _texto;

  const Resultado(this._imagem, this._texto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            _imagem,
            fit: BoxFit.cover,
            height: 300.0,
          ),
          Center(
            child: Text(
              _texto,
              style: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
