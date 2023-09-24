import 'package:flutter/material.dart';
import 'package:imcapp/ui/resultado.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  void _resetCampos() {
    pesoController.text = ''; // Define o texto do controlador para vazio
    alturaController.text = ''; // Define o texto do controlador para vazio
  }

  double calcularIMC(double peso, double altura) {
    return peso / (altura * altura);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.accessibility,
              size: 120,
              color: Colors.blue,
            ),
            TextFormField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Peso (kg)",
              ),
            ),
            TextFormField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Altura (cm)",
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                double peso = double.parse(pesoController.text);
                double altura = double.parse(alturaController.text) / 100;

                double imc = calcularIMC(peso, altura);

                String _texto = "";
                String _imagem = "";

                if (imc < 18.6) {
                  _texto = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
                  _imagem = "imagens/abaixo.png";
                } else if (imc >= 18.6 && imc < 24.9) {
                  _texto = "Peso Ideal (${imc.toStringAsPrecision(4)})";
                  _imagem = "imagens/normal.png";
                } else if (imc >= 24.9 && imc < 34.9) {
                  _texto = "Acima do peso (${imc.toStringAsPrecision(4)})";
                  _imagem = "imagens/risco.png";
                } else if (imc >= 34.9 && imc < 39.9) {
                  _texto = "Sobrepeso (${imc.toStringAsPrecision(4)})";
                  _imagem = "imagens/sobrepeso.png";
                } else if (imc >= 40) {
                  _texto = "Obesidade (${imc.toStringAsPrecision(4)})";
                  _imagem = "imagens/obeso.png";
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Resultado(_imagem, _texto),
                  ),
                );
              },
              child: const Text("Calcular"),
            ),
            ElevatedButton(
              onPressed: () {
                _resetCampos();
              },
              child: const Text("Resetar Campos"),
            ),
          ],
        ),
      ),
    );
  }
}
