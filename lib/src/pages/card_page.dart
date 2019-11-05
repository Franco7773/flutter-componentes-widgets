import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: EdgeInsets.all( 7.3 ),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

   Widget _cardType1() {

    return Card(
      elevation: 7.3,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(17.3)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.black ),
            title: Text('Soy el título de esta tarjeta'),
            subtitle: Text('Aquí estamos con la descripcíon de la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () { },
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: () { },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 7.3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.3)),
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 270 ),
            height: 377.5,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
          //   ),
          Container(
            padding: EdgeInsets.all(7.3),
            child: Text('No tengo idea de que escribir')
          )
        ],
      ),
    );
  }
}

