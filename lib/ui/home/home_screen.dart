import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{

  @override
  State<HomeScreen> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Center(
        child: Text("Home screen"),
      ),
    );
  }
}