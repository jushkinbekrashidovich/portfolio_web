import 'package:flutter/material.dart';
import 'package:portfolio_web/mobile/landing_page_mobile.dart';
import 'package:portfolio_web/web/landing_page_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth>800){
           return LandingPageWeb();

          }else{
            return LandingPageMobile();
          }
        }
        ),
    );
  }
}
