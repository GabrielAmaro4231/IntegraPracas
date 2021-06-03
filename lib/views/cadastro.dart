import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:integrapracas/views/login.dart';

class CadastroView extends StatefulWidget {
  @override
  _CadastroViewState createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('Cadastro')),
        body: SafeArea(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              tituloRegistro(),
              Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    inputNome(),
                    SizedBox(height: 10),
                    InputEmail(controller: emailController),
                    SizedBox(height: 10),
                    inputSenha(),
                    SizedBox(height: 10),
                    inputConfirmarSenha(),
                    SizedBox(height: 10),
                    Termos(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        botaoVoltar(context),
                        botaoConfirmar(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Column inputSenha() {
    return Column(
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
              hintText: 'Senha'))),
      ],
    );
  }
  Column inputConfirmarSenha() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text('Confirme a sua senha:')),
          SizedBox(height: 3),
          Center(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Confirmação da senha'))),
      ],
    );
  }

  Widget tituloRegistro() {
    return Container(
              padding: EdgeInsets.all(30),
              child: Text('Registre sua Conta.',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
            );
  }
  Widget botaoConfirmar() {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
          child: const Text('Confirmar'),
          onPressed: () {
            final form = formKey.currentState!;
            if (form.validate()) {
              final email = emailController.text;

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Your email is $email'),
              ));
            }
          });
    }

  Column inputNome() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text('Nome:')),
          SizedBox(height: 3),
          Center(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nome'))),
      ],
    );
  }
}

class InputEmail extends StatefulWidget {
  final TextEditingController controller;

  const InputEmail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text('Email:')),
          SizedBox(height: 3),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: 'Email', border: OutlineInputBorder()),
          
          validator: (email) {
            if ((!EmailValidator.validate(email!) || email.isEmpty)) {
              return 'Email Inválido';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}

  @override
  Widget botaoVoltar(BuildContext context) {
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

class InputField extends StatelessWidget {
  String label;
  InputField({this.label = ''});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(alignment: Alignment.centerLeft, child: Text('$label:')),
        SizedBox(height: 3),
        Center(
            child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), 
                  hintText: label))),
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
