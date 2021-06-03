import 'package:flutter/material.dart';

class ListaPracas extends StatelessWidget {
  const ListaPracas({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Praças', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ),
        body: SafeArea(
            child: ListView(children: [
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
        ])));
  }

  Container card() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 220,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Image.asset(
                  'assets/praca.png',
                  height: 220,
                  width: 220,
                )),
            Flexible(
              flex: 1,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Text('Praça das Flores',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold)),
                    Text('A 5Km', style: TextStyle(fontSize: 18.0)),
                    Container(
                        alignment: Alignment.center,
                        child: Text('R. Antônio de Godoy - Nova Redentora'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
