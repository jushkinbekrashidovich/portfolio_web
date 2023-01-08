import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.tealAccent,
          style: BorderStyle.solid,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(7),
      child: Text(text, style: GoogleFonts.openSans(fontSize: 15)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 35.0, color: Colors.black),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.black),
                  ),
                  child: Image.asset("assets/me.png"),
                )),
            TabsMobile(text: "Home", route: '/'),
            SizedBox(
              height: 20.0,
            ),
            TabsMobile(text: "Works", route: '/works'),
            SizedBox(
              height: 20.0,
            ),
            TabsMobile(text: "Blog", route: '/blog'),
            SizedBox(
              height: 20.0,
            ),
            TabsMobile(text: "About", route: '/about'),
            SizedBox(
              height: 20.0,
            ),
            TabsMobile(text: "Contact", route: '/contact'),
            SizedBox(
              height: 40.0,
            ),
            //TabsMobile(text: "Works", route: '/works'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await launchUrl(Uri.parse(
                        "https://instagram.com/jushkinbek_rashidovich"));
                  },
                  icon: SvgPicture.asset(
                    "assets/instagram.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrl(
                        Uri.parse("https://twitter.com/jushkinbekio"));
                  },
                  icon: SvgPicture.asset(
                    "assets/twitter.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrl(
                        Uri.parse("https://github.com/jushkinbekrashidovich"));
                  },
                  icon: SvgPicture.asset(
                    "assets/github.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [

            //intro first section 
              CircleAvatar(
                  radius: 117.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 113,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 110,
                      backgroundColor: Colors.white,
                      child: Image.asset("assets/me.png", filterQuality: FilterQuality.high,),

                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SansBold(35, "About me"),
                SizedBox(height: 10,),
                Sans(15,
                    "Hello, I'm Jushkinbek, I specialize in Flutter Development"),
                Sans(15,
                    "I've strive to ensure astounding performance with state of "),
                Sans(15,
                    "the art security for Android, IOS, Web, Mac, Linux, Windows"),
                SizedBox(
                  height: 15,
                ),
                Wrap(
                  spacing: 7,
                  runSpacing: 7,
                  children: [
                    tealContainer("Flutter"),
                    tealContainer("Firebase"),
                    tealContainer("Android"),
                    tealContainer("Windows"),
                  ],
                ),
              ],
            ),
          ),

        SizedBox(height: 40,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedCard(imagePath: "assets/webL.png", width: 200,),
            SizedBox(height: 30,),
            SansBold(20, "Web Development"),
            SizedBox(height: 10,),

          ],
        ),
        Sans(15.0, "I'm here to build your presence online with state of the art web apps"),
       Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedCard(imagePath: "assets/app.png", width: 200, reverse: true,),
            SizedBox(height: 30,),
            SansBold(20, "App Development"),
            SizedBox(height: 10,),

          ],
        ),
        Sans(15.0, "Do you need high performance a high-performance, responsive and beautiful app? Please contact me"),
          
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedCard(imagePath: "assets/firebase.png", width: 200,),
            SizedBox(height: 30,),
            SansBold(20, "Back-End Development"),
            SizedBox(height: 10,),

          ],
        ),
        Sans(15.0, "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that"),

        SizedBox(height: 25,),
          ],
        ),
        ),
      ),
    );
  }
}