import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoriteWidget extends StatefulWidget {

final bool _isFavorited;
final int _favoriteCount;

FavoriteWidget(this._isFavorited,this._favoriteCount);

  @override
  FavoriteWidgetState createState() => new FavoriteWidgetState();
}

class FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_isFavorited ? new Icon(Icons.star) : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: (){
              _toggleFavorite();
            },
          ),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text("$_favoriteCount"),
          ),
        )
      ],
    );
  }
}
