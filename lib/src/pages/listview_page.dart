import 'package:flutter/material.dart';

import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numbersList = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();

    _addEleven();

    _scrollController.addListener(() {
      if ( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        // _addEleven();
        fetchData();
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
        title: Text('Lists'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading()
        ],
      )
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getOnePage,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numbersList.length,
        itemBuilder: ( BuildContext context, int index ) {

          final image = _numbersList[ index ];
          
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }
  Future<Null> getOnePage() async {

    final duration = new Duration( seconds: 3 );
    new Timer( duration, () {

      _numbersList.clear();
      _ultimoItem++;
      _addEleven();
    });

    return Future.delayed( duration );
  }

  void _addEleven() {
    for (int i = 0; i < 11; i++) {
      _numbersList.add( _ultimoItem++ );
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration( seconds: 3 );
    new Timer( duration, respuestaHTTP );    
  }
    
  void respuestaHTTP() {

    _addEleven();
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 75,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 370 )
    );
  }

  Widget _createLoading() {
    if ( _isLoading ) {
      return  Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox( height: 15.0 )
        ],
      );
    } else {
      return Container();
    }
  }
}
