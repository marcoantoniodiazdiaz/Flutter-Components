import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu.provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot< List<dynamic> > snapshot) {
        return ListView(
          children: _crearListaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _crearListaItems(List <dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    for (var el in data) {
      print(el['ruta']);
      final widgetTemp = ListTile(
        title: Text(el['texto']),
        leading: getIcon(el['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {

          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage()
          // );

          // Navigator.push(context, route);
          Navigator.pushNamed(context, el['ruta']);

        },
      );

      opciones..add(widgetTemp)..add(Divider());
    }

    return opciones;
  }
}