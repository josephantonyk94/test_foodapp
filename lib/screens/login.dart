import 'package:flutter/material.dart';
import 'package:test_food_app/screens/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Spacer(),
            Image.asset("assets/iconfinder_google_firebase_1175544.png"),
            Spacer(),
            Container(width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueAccent,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                  AssetImage('assets/37468251556105321-128.png'),
                ),
                title: Text("Google"),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage())),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueAccent,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                title: Text("phone"),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage())),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
