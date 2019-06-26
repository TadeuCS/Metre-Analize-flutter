import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login_screen.dart';

void main() => runApp(MaterialApp(
      title: "Metre Analize",
      home: LoginScreen(),
      theme: ThemeData(
//          accentColor: Colors.deepOrangeAccent,
          primaryColor: Colors.deepOrange,
          buttonColor: Colors.deepOrange,
        focusColor: Colors.grey
      ),
      debugShowCheckedModeBanner: false,
    ));


