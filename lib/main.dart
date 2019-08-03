import 'package:flutter/material.dart';
import 'package:flutter_app/screens/configuracao_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/passwordRecuver_screen.dart';
import 'package:flutter_app/screens/splash_screen.dart';
import 'package:flutter_app/screens/venda_bruta_screen.dart';

void main() => runApp(MaterialApp(
      title: "Metre Analize",
      theme: ThemeData(
          hintColor: Colors.white,
          primaryColor: Colors.deepOrange,
          buttonColor: Colors.deepOrange),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/recovery': (context) => RecuperarSenhaScreen(),
        '/configuracao': (context) => ConfiguracaoScreen(),
        '/home': (context) => HomeScreen(),
        '/caixa': (context) => VendaBruta(),
      },
      debugShowCheckedModeBanner: false,
    ));
