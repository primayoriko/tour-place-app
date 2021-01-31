import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tour_place_app/models/place.dart';

class Search extends SearchDelegate<Place> {
  final List<Place> placeList;

  String selectedResult = "";
  // List<Place> placeResult;
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
      child: Center(
        child: Text(selectedResult),
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
            (place) => place.name.contains(query),
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
