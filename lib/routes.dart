import 'dart:js';

import 'package:flutter/material.dart';
import 'package:portfolio_web/mobile/contact_mobile.dart';
import 'package:portfolio_web/mobile/landing_page_mobile.dart';
import 'package:portfolio_web/web/contact_web.dart';
import 'package:portfolio_web/web/landing_page_web.dart';

class Routes {
  static Route<dynamic> genereateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return LandingPageWeb();
            } else
              return LandingPageMobile();
          }),
        );
        case '/contact':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return ContactWeb();
            } else
              return ContactMobile();
          }),
          settings: settings
        );
        default: 
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return LandingPageWeb();
            } else
              return LandingPageMobile();
          }),
        );
        
    }
  }
}
