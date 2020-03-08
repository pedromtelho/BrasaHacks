import 'package:ehlo55front/components/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPayment extends StatefulWidget {
  String data;
  double size;
  QRPayment(this.data, this.size);
  @override
  _QRPaymentState createState() => _QRPaymentState();
}

class _QRPaymentState extends State<QRPayment> {
  @override
  Widget build(BuildContext context) {
    return QrImage(
      backgroundColor: HexColor("#ffffff"),
      data: widget.data,
      version: QrVersions.auto,
      size: widget.size,
    );
  }
}
