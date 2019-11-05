import 'package:flutter/material.dart';

import 'package:components_flutter/src/providers/menu_provider.dart';
import 'package:components_flutter/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Components')
      ),
      body: _lista()
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.dataLoader(),
      initialData: [],
      builder: ( BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ) {

        return ListView(
          children: _listItems( snapshot.data, context ),
        ); 
      },
    );
  }

  List<Widget> _listItems( List<dynamic> data, BuildContext context ) {

    final List<Widget> options = [];

    if ( data == null ) { return []; }

    data.forEach( (option) {

      final widgetTemp = ListTile(
        title: Text( option['texto'] ),
        leading: getIcon( option['icon'] ),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.black ),
        onTap: () {

          Navigator.pushNamed( context, option['ruta'] );

          // final route = MaterialPageRoute(
          //   builder: ( context ) => AlertPage()
          // );
          // Navigator.push( context, route );
        },
      );

      options..add( widgetTemp )
             ..add( Divider() );
    });

    return options;
  }
}
