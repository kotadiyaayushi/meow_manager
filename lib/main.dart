import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:meow_manager/ui/routing/delegate.dart';
import 'package:meow_manager/ui/routing/navigation_stack_item.dart';
import 'package:meow_manager/ui/routing/parser.dart';
import 'package:meow_manager/ui/routing/stack.dart';
import 'package:meow_manager/ui/splash/splash_screen.dart';

void main(){
  usePathUrlStrategy();
  runApp(ProviderScope(child: MyApp()));
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

  final NavigationStack stack = NavigationStack([
    NavigationStackItem.home()
  ]);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: MainRouterDelegate(stack),
      routeInformationParser: MainRouteInformationParser(),
    );
  }
}