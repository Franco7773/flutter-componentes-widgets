import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          textColor: Colors.white,
          shape: StadiumBorder(),
          color: Colors.black,
          onPressed: () => _showAlert( context ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.flip_to_back ),
        onPressed: () {
          Navigator.pop( context );
        },
      ),
    );
  }

  void _showAlert( BuildContext context ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ( context ) {

        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular( 3.7 )),
          title: Text('Título'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es un ontenido de la caja de Alerta'),
              FlutterLogo( size: 73.5 )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of( context ).pop();
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of( context ).pop(),
            )
          ],
        );
      } 
    );
  }
}
