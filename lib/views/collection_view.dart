import 'package:flutter/material.dart';

import 'package:tour_place_app/components/favorite_button.dart';
import 'package:tour_place_app/components/search.dart';
import 'package:tour_place_app/components/footer.dart';

import 'package:tour_place_app/views/details_view.dart';
import 'package:tour_place_app/models/place.dart';
import 'package:tour_place_app/constants.dart';
import 'package:tour_place_app/data.dart';

class CollectionView extends StatefulWidget {
  final List<Place> placeList = tourismPlaceList;

  @override
  _CollectionViewState createState() => _CollectionViewState(placeList);
}

class _CollectionViewState extends State<CollectionView> {
  List<Place> placeList;

  _CollectionViewState(this.placeList);

  @override
  Widget build(BuildContext context) {
    // Sorting list dynamically but still bugs
    // placeList.sort((Place a, Place b) {
    //   if(a.isFavorite){
    //     return -1;
    //   } else if(b.isFavorite){
    //     return 1;
    //   }
    //   return 0;
    // });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(95, 20, 20, 1),
        title: Text('Tour Place'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: Search(placeList));
            },
          )
        ],
      ),
      bottomNavigationBar: Footer(),
      body: ListView(
        children: placeList.asMap().entries.map((entry) {
          var idx = entry.key;
          var place = entry.value;

          return FlatButton(
            onPressed: () async {
              final newPlace = await Navigator.push(
                context,
                MaterialPageRoute(
                  settings: RouteSettings(name: DetailsViewRoute, arguments: Map()),
                  builder: (context) => DetailsView(place: place),
                ),
              ).then((_) {
                  final arguments = ModalRoute.of(context).settings.arguments as Map;
                  final newPlace = arguments['place'];
                  return newPlace;
                });

              setState(() {
                placeList.replaceRange(idx, idx + 1, [newPlace]);
              });
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
                              FavoriteButton(place, this)
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
}
