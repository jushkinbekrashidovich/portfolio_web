import 'package:flutter/material.dart';
import 'package:portfolio_web/mobile/landing_page_mobile.dart';
import 'package:portfolio_web/routes.dart';
import 'package:portfolio_web/web/landing_page_web.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCk_7kCGwqnJt01oePH5IOLdYn64uMwwko",
            authDomain: "jushkinbek-214b1.firebaseapp.com",
            projectId: "jushkinbek-214b1",
            storageBucket: "jushkinbek-214b1.appspot.com",
            messagingSenderId: "95401261661",
            appId: "1:95401261661:web:db21e49571ac2bf64eabb4",
            measurementId: "G-QX3RKC0KVJ"));
  } else {
    await Firebase.initializeApp();
  }

  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        return Routes.genereateRoute(settings);
      },
      initialRoute: '/',
    );
  }
}
