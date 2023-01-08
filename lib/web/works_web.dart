import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/me.png"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SansBold(30, "Jushkinbek"),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    launchUrl(Uri.parse(
                        "https://instagram.com/jushkinbek_rashidovich"));
                  },
                  icon: SvgPicture.asset(
                    "assets/instagram.svg",
                    width: 35,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    launchUrl(Uri.parse("https://twitter.com/jushkinbekio"));
                  },
                  icon: SvgPicture.asset(
                    "assets/twitter.svg",
                    width: 35,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    launchUrl(
                        Uri.parse("https://github.com/jushkinbekrashidovich"));
                  },
                  icon: SvgPicture.asset(
                    "assets/github.svg",
                    width: 35,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 530,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/works.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: Row(
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  TabsWeb(
                    title: 'Home',
                    route: '/',
                  ),
                  Spacer(),
                  TabsWeb(
                    title: 'Works',
                    route: '/works',
                  ),
                  Spacer(),
                  TabsWeb(
                    title: 'Blog',
                    route: '/blog',
                  ),
                  Spacer(),
                  TabsWeb(
                    title: 'About',
                    route: '/about',
                  ),
                  Spacer(),
                  TabsWeb(
                    title: 'Contact',
                    route: '/contact',
                  ),
                  Spacer(),
                ],
              ),
            ),
          ];
        },
        body:ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 30,),
                SansBold(40, "Works"),

                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(imagePath: "assets/work1.png",
                    height: 200,
                    width: 350,
                    fit: BoxFit.contain,

                    ),
                    //SizedBox(width: 40,),
                    SizedBox(width: widthDevice/3,
                    child: Column(
                      children: [
                        SansBold(30, "Bookhub"),
                        SizedBox(height: 15,),
                        Sans(15, "Bookhub is an online marketplace application that allows people to sell/buy exchange their books")
                      ],
                    ),
                    ),

                  ],
                ),
              ],
            ),
          ],
          
        ) ,

    ));
  }
}