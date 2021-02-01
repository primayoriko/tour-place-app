import 'package:flutter/material.dart';
import 'package:tour_place_app/models/place.dart';
import 'package:tour_place_app/components/search.dart';
import 'package:tour_place_app/components/favourite_button.dart';
import 'package:tour_place_app/constants.dart';
import 'package:logging/logging.dart';


class DetailsView extends StatelessWidget {
  final Place place;
  // final _logger = Logger('logger');

  DetailsView({@required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(children: <Widget>[
                  Image.asset(place.imageAsset),
                  SafeArea(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            // Navigator.of(context).popUntil(ModalRoute.withName(HomeViewRoute));
                            Navigator.of(context).popUntil(ModalRoute.withName(CollectionViewRoute));
                            // Navigator.pop(context);
                          }),
                      FavouriteButton(place.isFavourite)
                    ],
                  ))
                ]),
                Container(
                  child: Text(
                    this.place.name,
                    textAlign: TextAlign.center,
                    // textAlign: TextAlignVertical.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.only(top: 20),
                ),
                Container(
                  child: Text(
                    "~ at " + this.place.location + " ~",
                    textAlign: TextAlign.center,
                    // textAlign: TextAlignVertical.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8),
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
                          Text(this.place.openDays)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.access_time),
                          SizedBox(height: 8),
                          Text(this.place.openTime)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.monetization_on),
                          SizedBox(height: 8),
                          Text(this.place.ticketPrice)
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                        this.place.description,
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
