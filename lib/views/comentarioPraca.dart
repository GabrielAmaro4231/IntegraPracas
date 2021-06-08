import 'package:flutter/material.dart';
import 'package:integrapracas/views/cadastro.dart';
import 'package:integrapracas/widgets/widgets.dart';

class ComentarioPraca extends StatelessWidget {
  const ComentarioPraca({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Praças', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          leading: BackButton(color: Colors.black),
        ),
        body: Column(children: [
          Container(
            padding: EdgeInsets.all(50),
            child: Column(children: [
              Container(alignment: Alignment.centerLeft, child: Text('Categoria')),
              SizedBox(height: 3),
              Categorias(),
              SizedBox(height: 50),
              Container(alignment: Alignment.centerLeft, child: Text('Seu texto')),
              SizedBox(height: 3),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder())),
              SizedBox(height: 80),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.all(30)),
                child: const Text('Adicionar Comentário'),
                onPressed: () {}),
          ],),)
          
        ]));
  }
}

class Categorias extends StatefulWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
 String? selected;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selected,
      items: ["Categoria 1", "Categoria 2", "Categoria 3", "Categoria 4",]
          .map((label) => DropdownMenuItem(
                child: Text(label),
                value: label,
              ))
          .toList(),
      onChanged: (value) {
        setState(() => selected = value!);
      },
    );
  }
}
