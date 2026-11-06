import 'package:flutter/material.dart';
import 'package:meow_manager/ui/splash/splash_screen.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}