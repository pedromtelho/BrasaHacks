import 'package:ehlo55front/components/Button.dart';
import 'package:ehlo55front/components/DriverView/QRPayment.dart';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:ehlo55front/models/InfoShip.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DriverPayment extends StatefulWidget {
  InfoShip infoShip;
  DriverPayment({this.infoShip});
  @override
  _DriverPaymentState createState() => _DriverPaymentState();
}

class _DriverPaymentState extends State<DriverPayment> {
  String data;

  Future fetchData(
      String url, String brand, String type, String quantity) async {
    var body = json.encode({
      'signature': 'Fazer do algoritmo',
      'lastUpdateHash': 'pegar automaticamente (info shippment)',
      'transactionType': '0',
      'productBrand': brand,
      'productType': type,
      'productQuantity': quantity,
    });
    final response = await http.post(
      url,
      body: body,
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );
    if (response.statusCode == 200) {
      data = json.decode(response.body)["data"]["signed_data"].toString();
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    final InfoShip args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: HexColor('#2E008B'),
      body: Container(
        child: FutureBuilder(
          future: fetchData(
              'http://10.92.175.188:3000/shipping/5e651dc4c4320757c93594f5',
              args.productBrand,
              args.productType,
              args.quantity),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextMont(
                        fontWeight: FontWeight.w200,
                        color: HexColor("#FFFFFF"),
                        textAlign: TextAlign.center,
                        text: "Apresente o QR code para o destinatário",
                        textSize: 30,
                      ),
                    ),
                  ),
                  QRPayment(data, 250),
                  Flexible(
                    flex: 1,
                    child: TextMont(
                      fontWeight: FontWeight.w200,
                      color: HexColor("#FFFFFF"),
                      textAlign: TextAlign.center,
                      text: "Após a leitura você será redirecionado",
                      textSize: 15,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Button(
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
                  )
                ],
              );
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
