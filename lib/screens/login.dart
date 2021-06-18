import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_food_app/model/cart.dart';
import 'package:test_food_app/model/table_menu_list.dart';
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
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/37468251556105321-128.png'),
                    ),
                    Spacer(),
                    Text(
                      "Google",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 20,
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                  create: (context) => Cart()),
                              ChangeNotifierProvider(
                                  create: (context) => RestaurentList())
                            ],
                            child: HomePage(),
                          )),
                );
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      Spacer(),
                      Text(
                        "phone",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  )),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
