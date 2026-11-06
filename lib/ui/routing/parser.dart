import 'package:flutter/cupertino.dart';
import 'package:meow_manager/ui/routing/navigation_stack_item.dart';
import 'package:meow_manager/ui/routing/navigation_stack_keys.dart';
import 'package:meow_manager/ui/routing/stack.dart';

class MainRouteInformationParser extends RouteInformationParser<NavigationStack>{

  @override
  Future<NavigationStack> parseRouteInformation(RouteInformation routeInformation) async{
    // TODO: implement parseRouteInformation
    final uri = routeInformation.uri;
    final segments = uri.pathSegments;
    final queryParams = uri.queryParameters;
    debugPrint('Query parameters: $queryParams');
    QueryParam.queryParam.parameters = Map<String, String>.from(queryParams);

    int i = 0;
    final items = <NavigationStackItem>[];
    while(i<segments.length){
      final segment = segments[i];
      if(segment == NavigationStackKeys.home){
        items.add(NavigationStackItem.home());
      }
      else if(segment == NavigationStackKeys.splash){
        items.add(NavigationStackItem.splash());
      }

      i++;
    }

    if(items.isEmpty){
      items.add(NavigationStackItem.home());
    }

    return NavigationStack(items);
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationStack configuration) {
    // TODO: implement restoreRouteInformation
    final pathSegments = <String>[];
    final queryParams = <String, String>{};

    for(final item in configuration.items){
      // debugPrint("$item");
      item.when(
          splash: (){
            pathSegments.add(NavigationStackKeys.splash);
          },
          home: (){
            pathSegments.add(NavigationStackKeys.home);
          },

      );
    }

    final uri = Uri(
      path: '/${pathSegments.join('/')}',
      queryParameters: queryParams.isEmpty ? null : queryParams,
    );

    return RouteInformation(uri: uri);
  }

}
