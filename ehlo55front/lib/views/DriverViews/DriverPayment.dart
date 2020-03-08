import 'package:ehlo55front/components/DriverView/QRPayment.dart';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DriverPayment extends StatefulWidget {
  @override
  _DriverPaymentState createState() => _DriverPaymentState();
}

class _DriverPaymentState extends State<DriverPayment> {
  String data;

  Future fetchData(String url) async {
    final response = await http.post(url);
    if (response.statusCode == 200) {
      print("entrou aqui");
      data = json.decode(response.body)["data"]["signed_data"].toString();
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchData('http://192.168.50.94:3000/shipping/5e651dc4c4320757c93594f5');
    return Scaffold(
      backgroundColor: HexColor('#2E008B'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          QRPayment(data, 250)
        ],
      ),
    );
  }
}
