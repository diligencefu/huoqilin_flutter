import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoriteWidget extends StatefulWidget {

final bool _isFavorited;
final int _favoriteCount;

FavoriteWidget(this._isFavorited,this._favoriteCount);

  @override
  FavoriteWidgetState createState() =>   FavoriteWidgetState();
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
          Container(
          padding:   EdgeInsets.all(0.0),
          child:   IconButton(
            icon: (_isFavorited ?   Icon(Icons.star) :   Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: (){
              _toggleFavorite();
            },
          ),
        ),
          SizedBox(
          width: 18.0,
          child:   Container(
            child:   Text("$_favoriteCount"),
          ),
        )
      ],
    );
  }
}
