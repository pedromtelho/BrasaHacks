import 'dart:convert';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/MarketView/DragButton.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:ehlo55front/models/InfoPayment.dart';
import 'package:flutter/material.dart';
import 'package:swipe_button/swipe_button.dart';

class ConfirmationScreen extends StatefulWidget {
  String value;
  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    InfoPayment args = ModalRoute.of(context).settings.arguments;
    var jsonArg = json.decode(args.data);
    print(args.data);
    return Scaffold(
      backgroundColor: HexColor('#2E008B'),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextMont(
                  fontWeight: FontWeight.w200,
                  color: HexColor("#FFFFFF"),
                  textAlign: TextAlign.center,
                  text: "Confirme o recebimento dos itens abaixo:",
                  textSize: 30,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Card(
                margin: EdgeInsets.all(50.0),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextMont(
                        fontWeight: FontWeight.w400,
                        color: HexColor("#000000"),
                        textAlign: TextAlign.justify,
                        text: "--> Marca do produto: " +
                            jsonArg["signed_data"]["shippmentUpdateDescriptor"]
                                    ["productBrand"]
                                .toString(),
                        textSize: 15,
                      ),
                      TextMont(
                        fontWeight: FontWeight.w400,
                        color: HexColor("#000000"),
                        textAlign: TextAlign.justify,
                        text: "--> Tipo do produto: " +
                            jsonArg["signed_data"]["shippmentUpdateDescriptor"]
                                    ["productType"]
                                .toString(),
                        textSize: 15,
                      ),
                      TextMont(
                        fontWeight: FontWeight.w400,
                        color: HexColor("#000000"),
                        textAlign: TextAlign.justify,
                        text: "--> Quantidade: " +
                            jsonArg["signed_data"]["shippmentUpdateDescriptor"]
                                    ["quantity"]
                                .toString(),
                        textSize: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            DragButton(
              route: "/Supermercado",
            )
          ],
        ),
      ),
    );
  }
}
