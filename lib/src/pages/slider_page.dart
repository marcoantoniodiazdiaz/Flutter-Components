import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _slider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            )
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
      value: _slider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (value) {
        setState(() {
          _slider = value;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://scontent.fmex4-2.fna.fbcdn.net/v/t1.0-9/54433601_2189200434507988_2772030235674148864_n.jpg?_nc_cat=111&_nc_ht=scontent.fmex4-2.fna&oh=a9de11b31a5f0a30a9447c1f2c0a66d1&oe=5D814095'),
      width: _slider,
      fit: BoxFit.contain,
    );
  }

  _crearCheckbox() {

    return CheckboxListTile(
      title: Text("Bloquear Slider"),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear Slider"),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }
}