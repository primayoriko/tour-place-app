import 'package:flutter/material.dart';
import 'package:basic_flutter_app/list_screen.dart';

class MenuScreen extends StatelessWidget {
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
                    "Tour App",
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                )
            ),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ListScreen();
                    },
                    settings: RouteSettings(name: 'main_screen')));
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
              onPressed: () {},
              child: Text("Exit"),
            ),
          ),
        ],
      ),
    );
  }
}
