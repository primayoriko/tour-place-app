import 'package:flutter/material.dart';
import 'package:tour_place_app/components/search.dart';
import 'package:tour_place_app/views/details_view.dart';
import 'package:tour_place_app/models/place.dart';
import 'package:tour_place_app/constants.dart';

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


var tourismPlaceList = [
  Place(
    name: 'Farm House Lembang',
    location: 'Lembang',
    description:
        'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    ticketPrice: 'Rp 25000',
    imageAsset: 'assets/images/waterfall.jpeg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
    ],
    isFavourite: true,
    rating: 4,
  ),
  Place(
    name: 'Monumen Nasional',
    location: 'Jakarta',
    description:
        'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    ticketPrice: 'Rp 25000',
    imageAsset: 'assets/images/waterfall.jpeg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
    ],
    isFavourite: true,
    rating: 5,
  ),
  Place(
    name: 'Curug Cikaso',
    location: 'Sukabumi',
    description:
        'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    ticketPrice: 'Rp 25000',
    imageAsset: 'assets/images/waterfall.jpeg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
    ],
    isFavourite: false,
    rating: 3,
  ),
  Place(
    name: 'Museum Geologi',
    location: 'Bandung',
    description:
        'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    ticketPrice: 'Rp 25000',
    imageAsset: 'assets/images/waterfall.jpeg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
    ],
    isFavourite: true,
    rating: 3,
  ),
];
