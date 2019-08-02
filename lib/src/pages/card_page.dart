import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 20.0,
          ),
          _cardTipo2()
        ],
        padding: EdgeInsets.all(10.0),
      ),
    );
  }

  _cardTipo1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Soy el titutlo de esta tarjeta"),
            subtitle: Text("Aqui estamos con la descripcion hijos de su puta madre estoy mamadisimo"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text("No tengo idea de que poner")
          ),
          FlutterLogo(
            size: 100,
            style: FlutterLogoStyle.stacked,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(20),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2,
            offset: Offset(0, 0)
          )
        ]
      ),
    );
  }
}