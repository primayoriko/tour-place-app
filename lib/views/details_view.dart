import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:tour_place_app/models/place.dart';
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
                            // Navigator.of(context).popUntil(ModalRoute.withName(CollectionViewRoute));
                            // Navigator.pop(context, place);
                            Navigator.of(context).popUntil((route) {
                              print(route.settings.name);
                              if (route.settings.name == CollectionViewRoute) {
                                (route.settings.arguments as Map)['place'] = place;
                                // print(((route.settings.arguments as Map)['place'] as Place).name);
                                return true;
                              }
                              return false;
                            });
                          }),
                      FavouriteButton(place)
                    ],
                  ))
                ]),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.symmetric(horizontal: BorderSide(width: 4, color: Color.fromRGBO(140, 50, 50, 0.5))),
                    color: Color.fromRGBO(95, 20, 20, 1),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        this.place.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "~ at " + this.place.location + " ~",
                        textAlign: TextAlign.center,
                        style: TextStyle(height: 2, fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                ),
                // Container(
                //   child:
                // ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(
                    // border: Border.symmetric(horizontal: BorderSide(width: 4, color: Color.fromRGBO(140, 50, 50, 0.5))),
                    color: Color.fromRGBO(140, 45, 45, 0.8),
                  ),
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
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 12),
                          child: Text(
                            "Your Rating",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: place.rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    )
                  )
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Color.fromRGBO(23, 23, 23, 0.80),
                    ),
                    child: Text(
                        this.place.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15)
                    )
                ),
                Container(
                  child: Text(
                    "Images",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(vertical: 15),
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    // border: Border.symmetric(horizontal: BorderSide(width: 4, color: Color.fromRGBO(140, 50, 50, 0.5))),
                    color: Color.fromRGBO(95, 30, 30, 1),
                  ),
                  child: Text(
                    "Copyright @MyTrip.co ~2021~",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  ),
                ),
            ],
          )
        )
    );
  }
}
