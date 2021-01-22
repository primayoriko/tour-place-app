import 'package:flutter/material.dart';
import 'package:tour_place_app/views/collection_view.dart';
import 'package:tour_place_app/constants.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 25, left: 35, right: 35),
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 35, top: 250),
            child: Center(
                child: Text(
              "Tour Place App",
              style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            )),
            decoration: BoxDecoration(color: Color.fromRGBO(95, 20, 20, 1)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: FlatButton(
              color: Color.fromRGBO(80, 20, 20, 1),
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 23, horizontal: 60),
              splashColor: Colors.blueAccent,
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, CollectionViewRoute);
              },
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) {
              //       return CollectionView();
              //     },
              //     settings: RouteSettings(name: 'home_view')));
              // },
              child: Text("View Places"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: FlatButton(
              color: Color.fromRGBO(80, 20, 20, 1),
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 23, horizontal: 60),
              splashColor: Colors.blueAccent,
              onPressed: () {},
              child: Text("Exit"),
            ),
          ),
        ],
      ),
    );
  }
}
