import 'package:flutter/material.dart';

class FavouriteButton extends StatefulWidget {
  final bool isFavourite;

  FavouriteButton(this.isFavourite);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState(this.isFavourite);
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isFavorite;

  _FavouriteButtonState(this.isFavorite);

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
