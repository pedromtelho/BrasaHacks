import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/SideBar.dart';
import 'package:ehlo55front/views/MyHomePage.dart';
import 'package:flutter/material.dart';

class DriverView extends StatefulWidget {
  @override
  _DriverViewState createState() => _DriverViewState();
}

class _DriverViewState extends State<DriverView> {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(
      colorAppBar: HexColor("#2E008B"),
      component: Container(),
      backgroundColor: HexColor("#ffffff"),
      sideBar: SideBar(
        backgroundColorAvatar: HexColor("#2E008B"),
        id: "13412341",
        listTiles: ["Histórico", "Reportar problema"],
        email: "joaquim@joaquim.com",
        name: "Joaquim",
      ),
    );
  }
}
