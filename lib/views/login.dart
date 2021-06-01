import 'package:flutter/material.dart';
import 'cadastro.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('Cadastro')),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(color: Colors.red, height: 300, width: 300),
            SizedBox(height: 20),
            Container(
              padding: new EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputField(label: 'Login'),
                  SizedBox(height: 20),
                  InputField(label: 'Senha'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 25)),
                    onPressed: () {},
                    child: Text('Login'),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () => print('apertado'),
                      child: Text('Esqueci minha senha',
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              decoration: TextDecoration.underline,
                              fontSize: 18))),
                  SizedBox(height: 15),
                  Divider(thickness: 2),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 25),
                        side: BorderSide(color: Colors.black)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CadastroView()),
                      );
                    },
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(color: Colors.black87),
                    ),
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
