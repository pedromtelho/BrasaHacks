import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Widget child;
  Color backgroundColor;
  Color borderColor;
  BorderRadius borderRadius;
  Button(
      {this.child, this.backgroundColor, this.borderColor, this.borderRadius});
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: widget.borderRadius,
          side: BorderSide(color: widget.borderColor)),
      child: widget.child,
      onPressed: () {},
      color: widget.backgroundColor,
    );
  }
}
