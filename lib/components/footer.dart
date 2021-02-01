import 'package:flutter/material.dart';

import 'package:tour_place_app/data.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        // border: Border.symmetric(horizontal: BorderSide(width: 4, color: Color.fromRGBO(140, 50, 50, 0.5))),
        color: Color.fromRGBO(95, 30, 30, 1),
      ),
      child: Text(
        "Copyright @$creatorName ~$year~",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
      ),
    );
  }
}