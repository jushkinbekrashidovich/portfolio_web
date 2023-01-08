import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
    urlLauncher(String imagePath, String url) {
    return IconButton(
      onPressed: () async {
        await launchUrl(
            Uri.parse(url));
      },
      icon: SvgPicture.asset(
        imagePath,
        color: Colors.black,
        width: 35,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
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
              urlLauncher("assets/instagram.svg", "https://instagram.com/jushkinbek_rashidovich/"),
              urlLauncher('assets/twitter.svg', "https://twitter.com/jushkinbekio"),
              urlLauncher("assets/github.svg", "https://github.com/jushkinbekrashidovich"),

              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 25.0),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            Spacer(
              flex: 3,
            ),
            TabsWeb(title: "Home", route: '/',),
            Spacer(),
            TabsWeb( title: "Works", route: '/works',),
            Spacer(),
            TabsWeb(title:"Blog", route: '/blog',),
            Spacer(),
            TabsWeb(title: "About", route: '/about',),
            Spacer(),
            TabsWeb(title:"Contact", route: '/contact',),
            Spacer(),
          ],
        ),
      ),
  

  body: ListView(
    children: [
      //about me first

      SizedBox(
        height: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SansBold(40, "About me"),
                SizedBox(height: 15,),
                Sans(15,
                        "Hello! I'm Jushkinbek Rashidovich, I specialize in Flutter Development."),
                    Sans(15,
                        "I strive to ensure astounding performance with \nstate of the art security for Android, IOS, Web, Mac, Linux and Windows"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        tealContainer('Flutter'),
                        SizedBox(width: 7.0,),
                        tealContainer("Android"),
                        SizedBox(width: 7.0,),
                        tealContainer("Firebase"),
                        SizedBox(width: 7.0,),
                        tealContainer("IOS"),
                        SizedBox(width: 7.0,),
                        tealContainer("Windows"),
                      ],
                    ),

              ],
            )
           ,CircleAvatar(
              radius: 147,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 143,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/me.png"),
              ),
            ),
          ],
        ),
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          AnimatedCard(imagePath: "assets/webL.png",
          height: 250,
          width: 250,
          ),
          SizedBox(
            width: widthDevice/3,
            child: Column(
              children: [
                SansBold(30, "Web Development"),
                SizedBox(height: 15,),
                Sans(15, "I am here to build your presence online with state of the art web apps"),
                
              ],
            ),
          ),

        ],
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          AnimatedCard(imagePath: "assets/app.png",
          height: 250,
          width: 250,
          reverse: true,
          ),
          SizedBox(
            width: widthDevice/3,
            child: Column(
              children: [
                SansBold(30, "Mobile Development"),
                SizedBox(height: 15,),
                Sans(15, "Do you need high performance a high-performance, responsive and beautiful app? Please contact me"),
                
              ],
            ),
          ),

        ],
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          AnimatedCard(imagePath: "assets/firebase.png",
          height: 250,
          width: 250,
          ),
          SizedBox(
            width: widthDevice/3,
            child: Column(
              children: [
                SansBold(30, "Back-End Development"),
                SizedBox(height: 15,),
                SansBold(15, "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that"),
                
              ],
            ),
          ),

        ],
      ),
      SizedBox(height: 40,),
    
    ],
  ),
    );
  }
}