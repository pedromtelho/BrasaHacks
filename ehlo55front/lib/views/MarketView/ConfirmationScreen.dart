import 'dart:convert';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/MarketView/DragButton.dart';
import 'package:ehlo55front/components/MarketView/TextFormEdit.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:ehlo55front/models/InfoMarketPayment.dart';
import 'package:ehlo55front/models/InfoPayment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipe_button/swipe_button.dart';

class ConfirmationScreen extends StatefulWidget {
  String value;
  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  var sendJson;
  TextEditingController brandInputController = new TextEditingController();
  var brandName;
  TextEditingController typeInputController = new TextEditingController();
  var typeName;
  TextEditingController quantityInputController = new TextEditingController();
  var quantityValue;

  composeJson() {
    sendJson = {
      "signed_data": {
        "updateDate": "2020-03-10T22:44:41.651Z",
        "lastUpdateHash": "pegar automaticamente (info shippment)",
        "shippmentUpdateDescriptor": {
          "transactionType": "1",
          "productBrand": brandName,
          "productType": typeName,
          "quantity": quantityValue
        },
        "signature": "Fazer do algoritimo"
      }
    };

    return sendJson;
  }

  Widget buildTextInputRow(
      String label,
      TextEditingController textEditingController,
      String hintText,
      TextInputType textInputType) {
    return Padding(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextMont(
                      fontWeight: FontWeight.w400,
                      color: HexColor("#000000"),
                      textAlign: TextAlign.justify,
                      text: label,
                      textSize: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onSubmitted: (String str) {
                                setState(() {
                                  switch (label) {
                                    case 'Marca do produto:':
                                      this.brandName =
                                          textEditingController.text;
                                      break;
                                    case 'Tipo do produto:':
                                      this.typeName =
                                          textEditingController.text;
                                      break;
                                    case 'Quantidade:':
                                      this.quantityValue =
                                          textEditingController.text;
                                      break;
                                    default:
                                      break;
                                  }
                                });
                              },
                              textAlign: TextAlign.center,
                              keyboardType: textInputType,
                              maxLines: 2,
                              enabled: true,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue[100])),
                                  hintText: hintText),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]));
    // TextMont(
    //   fontWeight: FontWeight.w400,
    //   color: HexColor("#000000"),
    //   textAlign: TextAlign.justify,
    //   text: "Tipo do produto: ",
    //   textSize: 20,
    // ),
    // Padding(
    //   padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Expanded(
    //         child: TextField(
    //           onSubmitted: (e) {
    //             setState(() {
    //               newType = e;
    //             });
    //           },
    //           textAlign: TextAlign.center,
    //           keyboardType: TextInputType.multiline,
    //           maxLines: 2,
    //           enabled: true,
    //           decoration: InputDecoration(
    //               border: UnderlineInputBorder(
    //                   borderSide:
    //                       BorderSide(color: Colors.blue[100])),
    //               hintText: jsonArg["signed_data"]
    //                           ["shippmentUpdateDescriptor"]
    //                       ["productType"]
    //                   .toString()),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
    // TextMont(
    //   fontWeight: FontWeight.w400,
    //   color: HexColor("#000000"),
    //   textAlign: TextAlign.justify,
    //   text: "Quantidade: ",
    //   textSize: 20,
    // ),
    // Padding(
    //   padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Expanded(
    //         child: TextField(
    //           onSubmitted: (e) {
    //             setState(() {
    //               newQuant = e;
    //             });
    //           },
    //           textAlign: TextAlign.center,
    //           keyboardType: TextInputType.multiline,
    //           maxLines: 2,
    //           enabled: true,
    //           decoration: InputDecoration(
    //               border: UnderlineInputBorder(
    //                   borderSide:
    //                       BorderSide(color: Colors.blue[100])),
    //               hintText: jsonArg["signed_data"]
    //                           ["shippmentUpdateDescriptor"]
    //                       ["quantity"]
    //                   .toString()),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    InfoPayment args = ModalRoute.of(context).settings.arguments;
    var jsonArg = json.decode(args.data);

    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextMont(
                  fontWeight: FontWeight.w200,
                  color: HexColor("#2E008B"),
                  textAlign: TextAlign.center,
                  text: "Confirme o recebimento dos itens",
                  textSize: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextMont(
                  fontWeight: FontWeight.w200,
                  color: HexColor("#000000"),
                  textAlign: TextAlign.center,
                  text:
                      "Caso possua alguma falha na entrega reescreva nos campos disponíveis abaixo",
                  textSize: 14,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 200.0,
                  child: ListView(
                    children: <Widget>[
                      buildTextInputRow(
                          'Marca do produto:',
                          brandInputController,
                          jsonArg["signed_data"]["shippmentUpdateDescriptor"]
                                  ["productBrand"]
                              .toString(),
                          TextInputType.multiline),
                      buildTextInputRow(
                          'Tipo do produto:',
                          typeInputController,
                          jsonArg["signed_data"]["shippmentUpdateDescriptor"]
                                  ["productType"]
                              .toString(),
                          TextInputType.multiline),
                      buildTextInputRow(
                          'Quantidade:',
                          quantityInputController,
                          jsonArg["signed_data"]["shippmentUpdateDescriptor"]
                                  ["quantity"]
                              .toString(),
                          TextInputType.number),
                    ],
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    print(composeJson());
                  },
                  child: new Text('test'))
              // DragButton(
              //   route: "/Valid",
              //   object: InfoMarketPayment(composeJson()),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
