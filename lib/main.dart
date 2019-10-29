import 'package:flutter/material.dart';
import 'package:flutter_app/screens/configuracao_screen.dart';
import 'package:flutter_app/screens/detalhamento_caixa_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/passwordRecuver_screen.dart';
import 'package:flutter_app/screens/splash_screen.dart';
import 'package:flutter_app/screens/venda_bruta_screen.dart';

void main() => runApp(MaterialApp(
      title: "Metre Analize",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getRoutes(),
      theme: getTheme(),
    ));

ThemeData getTheme() {
  return ThemeData(
        hintColor: Colors.white,
        primaryColor: Colors.deepOrange,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        buttonColor: Colors.deepOrange);
}

Map<String, WidgetBuilder> getRoutes() {
  return {
      '/': (context) => SplashScreen(),
      '/login': (context) => LoginScreen(),
      '/recovery': (context) => RecuperarSenhaScreen(),
      '/configuracao': (context) => ConfiguracaoScreen(),
      '/home': (context) => HomeScreen(),
      '/caixa': (context) => DetalhamentoCaixaEncerrado(),
      '/vendaBruta': (context) => DetalhamentoVendaBruta(),
    };
}
