import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";
  String _descText = "";

  void _limparCampos() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados";
      _descText = "";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcular() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if(imc <= 17) {
        _infoText = "Muito abaixo do peso (${imc.toStringAsPrecision(4)}).";
        _descText = "Anorexia, bulimia, osteoporose e auto consumo de massa muscular.";
      } else if (imc > 17 && imc <= 20) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)}).";
        _descText = "Transtornos digestivos, debilidade, fadiga crônica, stress, ansiedade.";
      } else if (imc > 20 && imc <= 24.9) {
        _infoText = "Peso normal (${imc.toStringAsPrecision(4)}).";
        _descText = "Em bom estado geral, boa vitalidade e boa aparência física.";
      } else if (imc > 24.9 && imc <= 29.9) {
        _infoText = "Sobrepeso (${imc.toStringAsPrecision(4)}).";
        _descText = "Fadiga, problemas digestivos, problemas circulatórios, má circulação, varizes.";
      } else if (imc > 29.9 && imc <= 34.9) {
        _infoText = "Obesidade de grau I (${imc.toStringAsPrecision(4)}).";
        _descText = "Diabetes, angina de peito, enfarto, trombo flebites, arterosclerose, embolias, alterações menstruais.";
      } else if (imc > 34.9 && imc <= 39.9) {
        _infoText = "Obesidade de grau II (${imc.toStringAsPrecision(4)}).";
        _descText = "Falta de ar, apneia, sonolência, trombose pulmonar, refluxo esofágico.";
      } else if (imc > 40) {
        _infoText = "Obesidade de grau III (${imc.toStringAsPrecision(4)}).";
        _descText = "Falta de ar, apneia, sonolência, trombose pulmonar, refluxo esofágico.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 20,
          toolbarOpacity: 0.8,
          backgroundColor: Colors.green,
          title: Text(
            "Cass Soft - Calculadora de IMC",
            style: TextStyle(
              fontSize: 17.0
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _limparCampos,
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person_outline, size: 90.0, color: Colors.green),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 18),
                  controller: weightController,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Insira seu peso!";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 18),
                  controller: heightController,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Insira sua altura!";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.green,
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 28.0),
                      ),
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          _calcular();
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _infoText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        _descText,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.copyright,
                      color: Colors.white70,
                    ),
                    Text(
                      "  "
                    ),
                    Text(
                      "https://www.linkedin.com/in/rogeriocassimiro/",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
