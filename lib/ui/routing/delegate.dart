
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meow_manager/ui/home/home_screen.dart';
import 'package:meow_manager/ui/routing/navigation_stack_item.dart';
import 'package:meow_manager/ui/routing/stack.dart';
import 'package:meow_manager/ui/splash/splash_screen.dart';

class MainRouterDelegate extends RouterDelegate<NavigationStack> with ChangeNotifier,PopNavigatorRouterDelegateMixin {
  NavigationStack stack;
  MainRouterDelegate(this.stack){
    stack.addListener(notifyListeners);
  }

  @override
  // TODO: implement navigatorKey
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Navigator(
      key: navigatorKey,
      pages: stack.items.map(buildPageFromNavigationItem).toList(),

      onPopPage: (route, result){
        if(!route.didPop(result)){
          return false;
        }
        if(stack.items.length<=1){
          return false;
        }
        stack.pop();
        return true;
      },



    );
  }

  Page<void> buildPageFromNavigationItem(NavigationStackItem item){
    return item.when(
        home: (){
          return MaterialPage(child: HomeScreen());
        },
        splash: (){
          return MaterialPage(child: SplashScreen());
        },

    );

  }


  // stack -> URL
  // important to implement to change url through the pressing buttons
  // from the screens
  @override
  // TODO: implement currentConfiguration
  NavigationStack get currentConfiguration => stack;


  // important to implement if i want to navigate direct through URL
  // Ex: http://localhost:64352/detail
  // URL -> stack of screens
  @override
  Future<void> setNewRoutePath(NavigationStack configuration) async {
    // TODO: implement setNewRoutePath
    stack.items = configuration.items;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    stack.removeListener(notifyListeners);
    super.dispose();
  }

}