import 'package:flutter/material.dart';

import 'package:tour_place_app/models/place.dart';

class FavoriteButton extends StatefulWidget {
  final Place place;
  final State statefulParent;

  FavoriteButton(this.place, [this.statefulParent]);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState(this.place, this.statefulParent);
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final State statefulParent;
  Place place;

  _FavoriteButtonState(this.place, this.statefulParent);

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
          if (statefulParent != null){
            statefulParent.setState(() {});
          }
        });
      },
    );
  }
}
