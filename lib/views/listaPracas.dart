import 'package:flutter/material.dart';
import 'package:integrapracas/views/infoPraca.dart';

class ListaPracas extends StatefulWidget {
  const ListaPracas({Key? key}) : super(key: key);

  @override
  _ListaPracasState createState() => _ListaPracasState();
}

class _ListaPracasState extends State<ListaPracas> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: SideDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Praças', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        body: SafeArea(
            child: ListView(children: [
          CardPraca(),
          CardPraca(),
          CardPraca(),
          CardPraca(),
          CardPraca(),
          CardPraca(),
        ])));
  }
}

class CardPraca extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 220,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InfoPracaView()),
          );
        },
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 20),
                      Text('Praça das Flores',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold)),
                      Text('A 5Km', style: TextStyle(fontSize: 18.0)),
                      Expanded(child: Container()),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text('R. Antônio de Godoy - Nova Redentora')),
                      Container(height: 50)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Integra Praças',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
