import 'dart:convert';
import 'package:ehlo55front/components/Button.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:http/http.dart' as http;
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/models/InfoAddItem.dart';
import 'package:flutter/material.dart';

class Storage extends StatefulWidget {
  @override
  _StorageState createState() => _StorageState();
}

class _StorageState extends State<Storage> {
  var sendJson;
  String responseStatus;
  String identificationScheme;

  insertNewPack(var data, String url) async {
    sendJson = {
      'packageId': data,
      'storeId': '5e73e32e61f1bf1ccddcfd86',
      'packQuantity': '3'
    };
    var body = jsonEncode(sendJson);
    final response = await http.post(
      url,
      body: body,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      responseStatus = json.decode(response.body)["status"];
      identificationScheme =
          json.decode(response.body)["data"]["info"]["identificationScheme"];
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    InfoAddItem args = ModalRoute.of(context).settings.arguments;
    var jsonArg = json.decode(args.data);
    return Scaffold(
      backgroundColor: HexColor('#fefefe'),
      body: Container(
        child: FutureBuilder(
          future:
              insertNewPack(jsonArg["id"], 'http://ehlo.toranja.xyz/stores/'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data["status"] == "success") {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          child: Image.asset(
                            'assets/frame_00_delay-0.05s.png',
                          ),
                        ),
                      ),
                    ),
                    TextMont(
                      fontWeight: FontWeight.w200,
                      color: HexColor("#000000"),
                      textAlign: TextAlign.center,
                      text: "Item adicionado!",
                      textSize: 35,
                    ),
                    TextMont(
                      fontWeight: FontWeight.w200,
                      color: HexColor("#000000"),
                      textAlign: TextAlign.center,
                      text: "Destaque os adesivos da caixa conforme a imagem.",
                      textSize: 15,
                    ),
                    TextMont(
                      fontWeight: FontWeight.w200,
                      color: HexColor("#000000"),
                      textAlign: TextAlign.center,
                      text: identificationScheme
                          .replaceAll('0', '⚫')
                          .replaceAll('1', '⚪'),
                      textSize: 25,
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        child: Button(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Supermercado');
                          },
                          borderRadius: BorderRadius.circular(25.0),
                          backgroundColor: HexColor("#FFFFFF"),
                          borderColor: HexColor("#FFFFFF"),
                          child: TextMont(
                            text: "VOLTAR",
                            color: HexColor("#2E008B"),
                            textSize: 15,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
