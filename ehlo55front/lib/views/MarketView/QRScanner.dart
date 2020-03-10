import 'package:ehlo55front/components/TextMont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QRScanner extends StatefulWidget {
  String value;
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextMont(text: "_scanBarcode"),
        ],
      ),
    );
  }
}
