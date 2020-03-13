import 'package:ehlo55front/views/DriverViews/DriverPayment.dart';
import 'package:ehlo55front/views/DriverViews/DriverView.dart';
import 'package:ehlo55front/views/MarketView/ConfirmationScreen.dart';
import 'package:ehlo55front/views/MarketView/MarketView.dart';
import 'package:ehlo55front/views/MarketView/Valid.dart';
import 'package:ehlo55front/views/RoleSelector.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EHLO55 project',
      initialRoute: '/',
      routes: {
        '/': (context) => RoleSelector(),
        '/Caminhoneiro': (context) => DriverView(),
        '/pay': (context) => DriverPayment(),
        '/Supermercado': (context) => MarketView(),
        '/Confirmation': (context) => ConfirmationScreen(),
        '/Valid': (context) => Valid()
        //  '/Pedidos': (context) => BaristaOrdersView(),
        //  '/Storage': (context) => BaristaStorageView()
      },
    );
  }
}
