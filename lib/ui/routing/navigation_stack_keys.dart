class NavigationStackKeys {
  static const String splash = 'splash';
  static const String home = 'home';

}

class QueryParam{
  QueryParam._();
  static final QueryParam queryParam = QueryParam._();

  Map<String, String> parameters = {};

}

class NavigationStackKeyMapper {
  NavigationStackKeyMapper._();

  static final NavigationStackKeyMapper mapper = NavigationStackKeyMapper._();

  static const Map<String, String> keyValueMapper = {
    NavigationStackKeys.splash: NavigationStackKeys.splash,
    NavigationStackKeys.home: NavigationStackKeys.home,

  };
  static String value(String key) => keyValueMapper[key] ?? '';
}