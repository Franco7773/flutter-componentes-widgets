import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.0;
  bool _lockCheck = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.only( top: 50.0 ),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Divider( height: 30.0 ),
            Expanded(
              child: _createImage()
            )
          ],
        )

      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.black,
      label: 'Tamaño: ${_sliderValue.round()}',
      // divisions: 30, 
      min: 10.0,
      value: _sliderValue,
      max: 300.0,
      onChanged: ( _lockCheck ) ? null : ( value ) {
        setState(() {
          _sliderValue = value;
        });
      },
    );
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _lockCheck,
      checkColor: Colors.white,
      activeColor: Colors.black,
      onChanged: ( value ) {
        setState(() {
          _lockCheck = value; 
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _lockCheck,
      inactiveThumbColor: Colors.black,
      activeColor: Colors.black,
      onChanged: ( value ) {
        setState(() {
          _lockCheck = value; 
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://purepng.com/public/uploads/large/purepng.com-batman-arkham-knightbatmansuperherocomicdc-comicsbob-kanebat-manbruce-wayne-1701528525691kseuf.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

}