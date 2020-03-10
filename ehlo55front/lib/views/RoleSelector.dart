import 'package:ehlo55front/components/Button.dart';
import 'package:ehlo55front/components/DropdownButton.dart';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/Logo.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:flutter/material.dart';

class RoleSelector extends StatefulWidget {
  @override
  _RoleSelectorState createState() => _RoleSelectorState();
}

class _RoleSelectorState extends State<RoleSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#2E008B'),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextMont(
                    fontWeight: FontWeight.w200,
                    color: HexColor("#FFFFFF"),
                    textAlign: TextAlign.center,
                    text: "BEM-VINDO A",
                    textSize: 40,
                  ),
                ),
              ),
              Logo(),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
                child: Button(
                  borderRadius: BorderRadius.circular(25.0),
                  backgroundColor: Colors.white,
                  borderColor: Colors.white,
                  child: DropdownButtonForm(
                    hintText: "Selecione seu cargo",
                    hintFontSize: 17,
                    underlineHeight: 2,
                    underlineColor: Colors.white,
                    hintColorText: HexColor('#2E008B'),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: HexColor('#2E008B'),
                    ),
                    iconSize: 20,
                    dropdownValue: '',
                    dropdownItems: ['Supermercado', 'Caminhoneiro', 'Barista'],
                    itemsColor: Colors.black,
                    navigate: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
