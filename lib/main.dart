import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learn_dev/routing/routes.dart';
import 'package:learn_dev/screens/login_screen/views/login_screen.dart';
import 'package:learn_dev/themes/theme_data.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //To Restrict app to portrait mode only.
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "GeoJit Sample App",
        theme: mainTheme,
        home: LoginScreen(),
        initialRoute: RouteClass.getHomeRoute(),
        getPages: RouteClass.routes,
      ),
    );
  }
}
