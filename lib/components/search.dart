import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:tour_place_app/models/place.dart';
import 'package:tour_place_app/components/favorite_button.dart';
import 'package:tour_place_app/views/details_view.dart';
import 'package:tour_place_app/constants.dart';

class Search extends SearchDelegate<Place> {
  final List<Place> placeList;

  String selectedResult = "";
  List<Place> recentList = [];

  Search(this.placeList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: ListView(
        children: placeList
            .where((place) =>
                place.name.toLowerCase().contains(query.toLowerCase()))
            .map((place) {
          return FlatButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: DetailsViewRoute),
                  builder: (context) => DetailsView(place: place),
                ),
              );
              // Navigator.of(context).pushNamed(DetailsViewRoute, arguments: place);
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Image.asset(place.imageAsset)
                      )
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 13, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Text(
                                    place.name,
                                    style: TextStyle(fontSize: 16.0),
                                  )
                              ),
                              FavoriteButton(place)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(place.location),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Place> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(placeList.where(
            // In the false case
            (place) => place.name.toLowerCase().contains(query.toLowerCase()),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index].name,
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index].name;
            // buildResults(context);
            showResults(context);
          },
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // return super.appBarTheme(context);
    return ThemeData(
      primaryColor: Color.fromRGBO(95, 20, 20, 1),
      primaryIconTheme: IconThemeData(
        color: Colors.white,
      ),
      // inputDecorationTheme: InputDecorationTheme(
      //   hintStyle:
      //   Theme.of(context).textTheme.title.copyWith(color: Colors.white),
      // ),
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
