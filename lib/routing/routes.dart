import 'package:get/get.dart';
import 'package:learn_dev/screens/home_screen/views/home_screen.dart';
import '../screens/login_screen/views/login_screen.dart';

//Route data will be added here..

class RouteClass {

  static String splash = '/';
  static String home = '/home';

  static String getHomeRoute() => splash;
  static String getInitialPagesRoute() => home;

  static List<GetPage> routes = [
    GetPage(name: '/', page: () => LoginScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
  ];

}
