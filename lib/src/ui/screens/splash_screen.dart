import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shared_Preferences();
  }

  void shared_Preferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool logged = prefs.getBool('logged');
    print("LOGGED: ${logged}");
    if (logged == true && logged != null) {
      Timer(Duration(seconds: 5),
          () => Navigator.pushReplacementNamed(context, "/home"));
    } else {
      Timer(Duration(seconds: 5),
          () => Navigator.pushReplacementNamed(context, "/login"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage("assets/splashScreen/fondoapp.jpg"),
                fit: BoxFit
                    .fitHeight, //Se ajusta la imagen al alto del contenedor
              ),
            ),
            child: new BackdropFilter(
              //Se añade una capa de difuminación sobre la imagen
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "ApiMusic",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      color: Colors.black,
                      indent: 40,
                      endIndent: 40,
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/splashScreen/iconmusic.png"),
                    backgroundColor: Colors.transparent,
                    maxRadius: 90,
                    minRadius: 80,
                  ),
                  Text(
                    "Una aplicación que te permite consultar tus Playlist y reproducir canciones",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
