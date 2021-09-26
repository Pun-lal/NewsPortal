import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:news_portal/views/splash_screen.dart';

void main() async {
  await dotenv.load(fileName: "assests/.env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewsPortalApp();
  }
}

class NewsPortalApp extends StatelessWidget {
  const NewsPortalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey[50],
      ),

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // initialRoute: "/",
      // getPages: [GetPage(name: "/", page: () => SplashScreen())],
    );
  }
}
