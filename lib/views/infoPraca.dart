import 'package:flutter/material.dart';

class InfoPracaView extends StatelessWidget {
  const InfoPracaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praça das flores', 
        style: TextStyle(color: Colors.black),), 
        backgroundColor: Colors.white, 
        leading: BackButton(color: Colors.black),),
      body: Column(
        children: [
          Image.asset('assets/praca.png'),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: (){}, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message, color: Colors.black,), 
                  Text('Adicionar Comentário', style: TextStyle(color: Colors.black)),],),)
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
              Comentario(),
              Comentario(),
              Comentario(),
              Comentario(),
              Comentario(),
              Comentario()
          ],),
          )
        ],
      ),
    );
  }
}

class Comentario extends StatelessWidget {
  const Comentario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.yellow,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nome de usuário'),
                Text('Lorem ipsum dolor sit amet')
                ]),
          ),
        )
      ],
            ),
    );
  }
}