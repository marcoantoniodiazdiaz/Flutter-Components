import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // _agregar10();
        _fetchdata();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (context, int index) {
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300?image=${_listaNumeros[index]}'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  _agregar10() {
    for (var i = 1; i < 10; i++) {
      ultimoItem++;
      _listaNumeros.add(ultimoItem);
    }

    setState(() {});
  }

  Future _fetchdata() async {
    _isLoading = true;
    setState(() {});
    return new Timer(Duration(seconds: 2), respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );

    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return CircularProgressIndicator();
    } else {
      return Container();
    }
  }

  Future<Null> _obtenerPagina1() async {

    final duration = Duration(seconds: 2);

    new Timer(duration, () {
      _listaNumeros.clear();
      ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }
}