import 'package:flutter/material.dart';

class CadastroView extends StatefulWidget {
  @override
  _CadastroViewState createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('Cadastro')),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Registre sua Conta.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
        SizedBox(height: 100),
        Container(
          padding: new EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BuildInputField(label: 'Nome'),
              BuildInputField(label: 'E-mail'),
              BuildInputField(label: 'Confirmação do E-mail'),
              BuildInputField(label: 'Senha'),
              BuildInputField(label: 'Confirmação da Senha'),
              Termos(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 25),
                        side: BorderSide(color: Colors.black)),
                    onPressed: () {},
                    child: Text(
                      'Voltar',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 25)),
                    onPressed: () {},
                    child: const Text('Confirmar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class BuildInputField extends StatelessWidget {
  String label;
  BuildInputField({this.label = ''});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text('${label}:'),
        ),
        SizedBox(height: 3),
        Center(
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: label))),
        SizedBox(height: 25)
      ],
    );
  }
}

class Termos extends StatefulWidget {
  @override
  _TermosState createState() => _TermosState();
}

class _TermosState extends State<Termos> {
  bool valor = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: valor,
        onChanged: (value) {
          setState(() {
            valor = !valor;
          });
        },
        title: Text('Eu concordo com os Termos de Segurança'),
      ),
    );
  }
}
