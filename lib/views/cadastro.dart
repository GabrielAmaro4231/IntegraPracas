import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:integrapracas/views/login.dart';

class CadastroView extends StatefulWidget {
  @override
  _CadastroViewState createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  @override
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('Cadastro')),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Text('Registre sua Conta.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputField(label: 'Nome'),
                  SizedBox(height: 25),
                  InputField(label: 'E-mail'),
                  SizedBox(height: 25),
                  InputField(label: 'Confirmação do E-mail'),
                  SizedBox(height: 25),
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Senha:')),
                      SizedBox(height: 3),
                      Center(
                          child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Insira a sua senha'))),
                    ],
                  ),
                  SizedBox(height: 25),
                  InputField(label: 'Confirmação da Senha'),
                  Termos(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BotaoVoltar(),
                      BotaoConfirmar(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
class BotaoConfirmar extends StatelessWidget {
  const BotaoConfirmar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
      child: const Text('Confirmar'),
      onPressed: () {
        }
    );
  }
}

class BotaoVoltar extends StatelessWidget {
  const BotaoVoltar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          side: BorderSide(color: Colors.black)),
      child: Text(
        'Voltar',
        style: TextStyle(color: Colors.black87),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginView()),
        );
      },
    );
  }
}

class InputField extends StatelessWidget {
  String label;
  InputField({this.label = ''});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Container(
              alignment: Alignment.centerLeft, child: Text('$label:')),
        ),
        SizedBox(height: 3),
        Center(
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: label))),
        // SizedBox(height: 25)
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
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: valor,
        onChanged: (value) {
          setState(() {
            valor = !valor;
          });
        },
        title: Text('Aceito os Termos de Uso'),
      ),
    );
  }
}
