import 'package:flutter/material.dart';
import 'package:tour_place_app/components/search.dart';
import 'package:tour_place_app/views/details_view.dart';
import 'package:tour_place_app/models/place.dart';
import 'package:tour_place_app/constants.dart';
import 'package:tour_place_app/data.dart';

class CollectionView extends StatefulWidget {
  final List<Place> placeList = tourismPlaceList;

  @override
  _CollectionViewState createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(95, 20, 20, 1),
        title: Text('Tour Place'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: Search(widget.placeList));
            },
          )
        ],
      ),
      bottomNavigationBar: Container(
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
      body: ListView(
        children: widget.placeList.map((place) {
          return FlatButton(
            // onPressed: () {
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //     return DetailsView(place: place);
            //   },
            //   settings: RouteSettings(name: 'collection_view')));
            // },
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
                    child: Image.asset(place.imageAsset),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: TextStyle(fontSize: 16.0),
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
}
