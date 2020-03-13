import 'package:ehlo55front/models/InfoMarketPayment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormEdit extends StatefulWidget {
  String hintText;
  TextAlign textAlign;
  Color underLineColor;
  List<TextInputFormatter> inputFormatters;
  TextInputType inputType;
  var controller;
  TextFormEdit(
      {this.hintText,
      this.textAlign,
      this.underLineColor,
      this.inputFormatters,
      this.inputType,
      this.controller});
  @override
  _TextFormEditState createState() => _TextFormEditState();
}

class _TextFormEditState extends State<TextFormEdit> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      //   onEditingComplete: () {
      //   InfoMarketPayment(newBrand, newType, newQtd);
      // },
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      textAlign: widget.textAlign,
      keyboardType: widget.inputType,
      maxLines: 2,
      enabled: true,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.underLineColor)),
          hintText: widget.hintText),
    );
  }
}
