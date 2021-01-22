import 'package:flutter/material.dart';
import 'package:tour_place_app/models/place.dart';

class FavouriteButton extends StatefulWidget {
  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Place place;

  DetailScreen({@required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(children: <Widget>[
                  Image.asset('assets/images/waterfall.jpeg'),
                  SafeArea(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).popUntil((route){
                              // return route.isFirst;
                              return route.settings.name == "list_screen";
                            });
                            // Navigator.pop(context);
                          }),
                      FavouriteButton()
                    ],
                  ))
                ]),
                Container(
                  child: Text(
                    'Farm Houses',
                    textAlign: TextAlign.center,
                    // textAlign: TextAlignVertical.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.only(top: 20),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          SizedBox(height: 8),
                          Text('Open Weekend')
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.access_time),
                          SizedBox(height: 8),
                          Text('Open Weekend')
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.monetization_on),
                          SizedBox(height: 8),
                          Text('Open Weekend')
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                        'lorem ipsum sir dolor amet.. ... .... ...asdsa ..sad sad.. .asds ad.s',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15))),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                            'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                            'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                            'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                      ),
                    ],
                  ),
                ),
            ],
          )
        )
    );
  }
}
