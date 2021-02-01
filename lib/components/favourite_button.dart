import 'package:flutter/material.dart';

import 'package:tour_place_app/models/place.dart';

class FavouriteButton extends StatefulWidget {
  final Place place;

  FavouriteButton(this.place);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState(this.place);
}

class _FavouriteButtonState extends State<FavouriteButton> {
  Place place;

  _FavouriteButtonState(this.place);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        place.isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          place.isFavorite = !place.isFavorite;
        });
      },
    );
  }
}
