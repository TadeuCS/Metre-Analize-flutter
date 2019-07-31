import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login_screen.dart';

void main() => runApp(MaterialApp(
      title: "Metre Analize",
      home: LoginScreen(),
      theme: ThemeData(
          hintColor: Colors.white,
          primaryColor: Colors.deepOrange,
          buttonColor: Colors.deepOrange
      ),
      debugShowCheckedModeBanner: false,
    ));


