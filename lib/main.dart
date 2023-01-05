import 'package:flutter/material.dart';
import 'package:portfolio_web/mobile/landing_page_mobile.dart';
import 'package:portfolio_web/routes.dart';
import 'package:portfolio_web/web/landing_page_web.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings){
        return Routes.genereateRoute(settings);
        
      },
      initialRoute: '/',
    );
  }
}
