import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();  

}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _selectedOpt = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Súper Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs texto'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 7.3, vertical: 17.5),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate( context ),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular( 23.7 )
        ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Tu nombre completo',
        labelText: 'Nombre y Apellido',
        helperText: 'Sólo estoy practicando',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: ( value ) {
        setState(() {
          _nombre = value;          
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
      trailing: Text(_selectedOpt),
    );
  }

  Widget _createEmail() {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular( 23.7 )
        ),
        hintText: 'Tu correo electronico',
        labelText: 'Correo principal',
        suffixIcon: Icon( Icons.alternate_email ),
        icon: Icon( Icons.email )
      ),
      onChanged: ( value ) => setState(() { _email = value; })
    );
  }

  Widget _createPassword() {
    return TextField(
      // autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular( 23.7 )
        ),
        hintText: 'Tu nueva contraseña',
        labelText: 'Clave primaria',
        suffixIcon: Icon( Icons.lock_open ),
        icon: Icon( Icons.lock )
      ),
      onChanged: ( value ) => setState(() { _email = value; })
    );
  }

  Widget _createDate( BuildContext context ) {
    return TextField(
      // autofocus: true,
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular( 23.7 )
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha',
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        icon: Icon( Icons.calendar_today )
      ),
      onTap: () {
        FocusScope.of( context ).requestFocus( new FocusNode() );
        _selectDate( context );
      },
    );
  }

  void _selectDate( BuildContext context ) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2017),
      lastDate: new DateTime(2023),
      locale: Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha; 
      });
    }  
  }

  List<DropdownMenuItem<String>> _getOptionsDropdown() {

    List<DropdownMenuItem<String>> list = new List();

    _poderes.forEach( (poder) {
      list.add( DropdownMenuItem(
        child: Text( poder ),
        value: poder,
      ));
    });
    return list;
  }
  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon( Icons.select_all ),
        Expanded(
          child: DropdownButton(
            value: _selectedOpt,
            items: _getOptionsDropdown(),
            onChanged: ( opt ) {
              setState(() {
                _selectedOpt = opt;
              });
            },
          ),
        )
      ],
    );
    
  }
}

