import 'package:flutter/material.dart';

class HomePagesTemp extends StatelessWidget {

  final opciones = ["Uno", "Dos", "Tres", "Cuatro"]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(
        children: _crearItemsCorta()
      ),
    );
  }

  List<Widget> _crearItems() {

    List<Widget> lista = new List<Widget>();

    for (String opc in opciones) {
      final tempWidget = ListTile(
        title: Text(opc),
      );

      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text("$item!!"),
            subtitle: Text("Este es un subtitulo"),
            leading: Icon(Icons.account_box),
            trailing: Icon(Icons.arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}