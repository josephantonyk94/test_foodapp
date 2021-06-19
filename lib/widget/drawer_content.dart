import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_food_app/screens/login.dart';

class DrawerContents extends StatelessWidget {
  const DrawerContents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              height: 200,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://unsplash.com/photos/2LowviVHZ-E/download?force=true&w=640"),
                  ),
                  Text(
                    "Muhammed Naseem",
                  ),
                  Text("ID:410"),
                ],
              ),
            ),
            height: 300,
            width: 500,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightGreen, Colors.lightGreenAccent]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage())),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.grey,
                    ),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage())),
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      width: 340,
      color: Colors.white,
    );
  }
}
