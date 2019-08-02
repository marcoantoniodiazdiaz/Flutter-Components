import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = "";
  String _fecha = "";
  String _opcionSeleccionada = "Volar";

  List<String> _poderes = ['Volar', 'Rayos X', 'Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20
        ),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(),
          Divider(),
          _crearDropdown()
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        counter: Text("Cantidad de Letras: ${_nombre.length}"),
        hintText: "Nombre de la persona",
        labelText: "Nombre:",
        helperText: "Nombre de la persona en cuestion",
        suffixIcon: Icon(Icons.verified_user),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (val) {
        setState(() {
          _nombre = val;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: "Email",
        labelText: "Email:",
        helperText: "Ingresa tu correo electronico",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (val) {
        setState(() {
          _nombre = val;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: "Contraseña",
        labelText: "Contraseña:",
        helperText: "Ingresa tu contraseña",
        suffixIcon: Icon(Icons.lock_outline),
        icon: Icon(Icons.lock)
      ),
      onChanged: (val) {
        setState(() {
          _nombre = val;
        });
      },
    );
  }

  Widget _crearFecha() {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: "Fecha de nacimiento",
        labelText: "Fecha de nacimiento:",
        helperText: "Ingresa tu fecha de nacimiento",
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.account_box)
      ),
      onTap: () {

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if (picked != null) {
      _fecha = picked.toString();
      _inputFieldDateController.text = _fecha;
    }
  }

  List<DropdownMenuItem<String>> getOpciones() {
    List<DropdownMenuItem<String>> lista = new List();

    for (String el in _poderes) {
      lista.add(
        DropdownMenuItem(
          child: Text(el),
          value: el,
        )
      );
    }

    return lista;
  }
  
  Widget _crearDropdown() {
    return DropdownButton(
      value: _opcionSeleccionada,
      items: getOpciones(),
      onChanged: (opc) {
        setState(() {
          _opcionSeleccionada = opc;
        });
      },
    );
  }
}