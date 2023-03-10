import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_web/components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  urlLauncher(String imagePath, String url) {
    return IconButton(
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
      icon: SvgPicture.asset(
        imagePath,
        color: Colors.black,
        width: 35,
      ),
    );
  }

  var logger = Logger();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
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
                urlLauncher("assets/instagram.svg",
                    "https://instagram.com/jushkinbek_rashidovich/"),
                urlLauncher(
                    'assets/twitter.svg', "https://twitter.com/jushkinbekio"),
                urlLauncher("assets/github.svg",
                    "https://github.com/jushkinbekrashidovich"),
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
            TabsWeb(
              title: "Home",
              route: '/',
            ),
            Spacer(),
            TabsWeb(
              title: "Works",
              route: '/works',
            ),
            Spacer(),
            TabsWeb(
              title: "Blog",
              route: '/blog',
            ),
            Spacer(),
            TabsWeb(
              title: "About",
              route: '/about',
            ),
            Spacer(),
            TabsWeb(
              title: "Contact",
              route: '/contact',
            ),
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
                    AnimatedCard(
                      imagePath: "assets/app.png",
                      text: 'App Development',
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePath: "assets/webL.png",
                      text: 'Web Development',
                    ),
                    AnimatedCard(
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
            child: Form(
              key: formKey,
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
                            Containerwidth: 350,
                            text: "First Name",
                            hintText: "Please type your first name",
                            controller: _firstnameController,
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "First name is required";
                              }
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextForm(
                            text: "Email",
                            Containerwidth: 350,
                            hintText: "Please enter your email address",
                            controller: _emailController,
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Email is required";
                              }
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextForm(
                            text: "Last name",
                            Containerwidth: 350,
                            hintText: "Please Enter your last name",
                            controller: _lastNameController,
                            // validator: (text) {
                            //   if (text.toString().isEmpty) {
                            //     return "Last name is required";
                            //   }
                            // },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextForm(
                            text: "Phone",
                            Containerwidth: 350,
                            hintText: "Please enter your phone number",
                            controller: _phoneController,
                            // validator: (text) {
                            //   if (text.toString().isEmpty) {
                            //     return "Phone number is required";
                            //   }
                            // },
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextForm(
                    text: "Message",
                    Containerwidth: widthDevice / 1.5,
                    hintText: "Please type your message",
                    controller: _messageController,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Message is required";
                      }
                    },
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
                    onPressed: () async{

                      final addData = new AddDataFirestore();
                      logger.d(_firstnameController.text);
                      if(formKey.currentState!.validate()){
                        await addData.addResponse(_firstnameController.text, _lastNameController.text, _emailController.text, _phoneController.text, _messageController.text);
                       formKey.currentState!.reset();
                      DialogError(context);
                      
                      };
                    },
                  ),
                ],
              ),
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
