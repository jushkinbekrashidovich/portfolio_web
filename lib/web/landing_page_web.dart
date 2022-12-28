import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/components.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(),
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
            TabsWeb("Home"),
            Spacer(),
            TabsWeb("Works"),
            Spacer(),
            TabsWeb("Blog"),
            Spacer(),
            TabsWeb("About"),
            Spacer(),
            TabsWeb("Contact"),
            Spacer(),
          ],
        ),
      ),
      body: ListView(
        children: [
          //first section
          Container(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20),
                            )),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: SansBold(15, "Hello, I'm")),
                    SizedBox(
                      height: 15,
                    ),
                    SansBold(55, "Jushkinbek"),
                    Sans(30, "Flutter Developer"),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.mail),
                        SizedBox(
                          width: 20,
                        ),
                        Sans(15, "jushqinbekbekniyozov@gmail.com")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.phone),
                        SizedBox(
                          width: 20,
                        ),
                        Sans(15, "+99888 018 9977")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.location_solid),
                        SizedBox(
                          width: 20,
                        ),
                        Sans(15, "Tashkent, Uzbekistan")
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(
                        radius: 140, child: Image.asset("assets/me.png")),
                  ),
                ),
              ],
            ),
          ),
          //second section
          Container(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/web.jpg",
                  height: widthDevice / 1.9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(40, "About Me"),
                    SizedBox(
                      height: 15,
                    ),
                    Sans(15,
                        "Hello! I'm Jushkinbek Rashidovich, I specialize in Flutter Development."),
                    Sans(15,
                        "I strive to ensure astounding performance with \nstate of the art security for Android, IOS, Web, Mac, Linux and Windows"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.all(7),
                          child: Sans(15, "Flutter"),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.all(7),
                          child: Sans(15, "Firebase"),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.all(7),
                          child: Sans(15, "Web"),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.all(7),
                          child: Sans(15, "Android/IOS"),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.all(7),
                          child: Sans(15, "Python"),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          //third section
          Container(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold(40, "What I do?"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCardWeb(
                      imagePath: "assets/app.png",
                      text: 'App Development',
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCardWeb(
                      imagePath: "assets/webL.png",
                      text: 'Web Development',
                    ),
                    AnimatedCardWeb(
                      imagePath: "assets/firebase.png",
                      text: 'Back-end Development',
                    ),
                  ],
                ),
              ],
            ),
          ),
          //fourth section
          Container(
            height: heightDevice,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold(40, "Contact Me"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          width: 350,
                          heading: "First Name",
                          hintText: "Please type your first name",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextForm(
                            heading: "Email",
                            width: 350,
                            hintText: "Please enter your email address"),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                            heading: "Last name",
                            width: 350,
                            hintText: "Please Enter your last name"),
                        SizedBox(
                          height: 15,
                        ),
                        TextForm(
                            heading: "Phone",
                            width: 350,
                            hintText: "Please enter your phone number")
                      ],
                    ),
                  ],
                ),
                TextForm(
                  heading: "Message",
                  width: widthDevice / 1.5,
                  hintText: "Please type your message",
                  maxLine: 10,
                ),
                MaterialButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 60.0,
                  minWidth: 200.0,
                  color: Colors.tealAccent,
                  child: SansBold(20.0, "Submit"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
