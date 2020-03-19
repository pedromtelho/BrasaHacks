import 'dart:convert';
import 'package:ehlo55front/components/Button.dart';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:ehlo55front/models/InfoMarketPayment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Valid extends StatefulWidget {
  @override
  _ValidState createState() => _ValidState();
}

class _ValidState extends State<Valid> with TickerProviderStateMixin {
  String responseStatus;

  Future updateShippingBarSign(var data, String url) async {
    var body = jsonEncode(data);
    final response = await http.post(
      url,
      body: body,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      responseStatus = json.decode(response.body)["status"];
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    final InfoMarketPayment args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: HexColor('#fefefe'),
      body: Container(
        child: FutureBuilder(
          future: updateShippingBarSign(args.data,
              "http://ehlo.toranja.xyz/shipping/2/5e73e16861f1bf1ccddcfd72"),
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
                      text: "Confirmação realizada com sucesso!",
                      textSize: 35,
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        child: Button(
                          onPressed: () {
                            args.whoIsReceiving == "market"
                                ? Navigator.pushNamed(context, '/Supermercado')
                                : Navigator.pushNamed(context, '/Barista');
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
