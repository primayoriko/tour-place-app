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
                // Navigator.pushNamed(context, CollectionViewRoute);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    settings: RouteSettings(name: CollectionViewRoute, arguments: Map()),
                    builder: (context) => CollectionView(),
                  ),
                );
              },
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
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0)), //this right here
                          child: Container(
                            height: 250.0,
                            width: 230.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.symmetric(horizontal: BorderSide(width: 4, color: Color.fromRGBO(140, 50, 50, 0.5))),
                                    color: Color.fromRGBO(95, 20, 20, 1),
                                  ),
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'Cool',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'Awesome',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                Container(padding: EdgeInsets.only(top: 50.0)),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Got It!',
                                      style: TextStyle(
                                          color: Colors.purple, fontSize: 18.0),
                                    ))
                              ],
                            ),
                          ),
                        ));
              },
              child: Text("Exit"),
            ),
          ),
        ],
      ),
    );
  }
}
