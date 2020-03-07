import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  Widget component;
  Widget sideBar;
  Widget titleAppBar;
  Color backgroundColor;
  Color colorAppBar;
  MyHomePage(
      {this.component,
      this.sideBar,
      this.backgroundColor,
      this.colorAppBar,
      this.titleAppBar});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.titleAppBar,
        backgroundColor: widget.colorAppBar,
      ),
      backgroundColor: widget.backgroundColor,
      body: widget.component,
      drawer: widget.sideBar,
    );
  }
}
