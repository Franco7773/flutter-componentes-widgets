import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final List<String> options = ['One', 'Two', 'Three', 'Four', 'Five']; 

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componente')
      ),
      body: ListView(
        // children: _createItems()
        children: _createItemsShort() 
      )
    );
  }

  // List<Widget> _createItems() {

  //   List<Widget> lista = new List<Widget>();

  //   for ( String option in options ) {

  //     final tempWidget = ListTile(
  //       title: Text( option ),
  //     );

  //     lista..add( tempWidget )
  //          ..add( Divider() );
  //   }

  //   return lista;
  // }

  List<Widget> _createItemsShort() {

    return options.map(( item ) {

      return Column(
        children: <Widget>[
          ListTile(
            title: Text( item + '!' ),
            subtitle: Text( 'Juajajjajjajajaja AMO Flutter' ),
            leading: Icon( Icons.account_balance_wallet ),
            trailing: Icon( Icons.keyboard_arrow_right ),
            onTap: () { },
          ),
          Divider()
        ],
      );
    }).toList();
  }
}