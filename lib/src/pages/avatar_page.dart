import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(1.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY5SFzGGICx5-AMRYhVx8Ggu89NecZ9W4dAHQhOLpMc0TtvVp0&s'),
              radius: 25.3,
            ),
          ),
          Container(
            margin: EdgeInsets.only( right: 7.0 ),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY5SFzGGICx5-AMRYhVx8Ggu89NecZ9W4dAHQhOLpMc0TtvVp0&s'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration( milliseconds: 270 ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
