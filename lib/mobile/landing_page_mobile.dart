import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_web/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});


  

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
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
var logger = Logger();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
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
        body: ListView(
          children: [
            //first section
            CircleAvatar(
                    radius: 117.0,
                    backgroundColor: Colors.tealAccent,
                    child: CircleAvatar(
                      radius: 110,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/me.png"),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: SansBold(15, "Hello I'm "),
                      ),
                      SansBold(40, "Jushkinbek"),
                      SansBold(20, "Flutter Developer")
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: [
                          Icon(CupertinoIcons.mail),
                          Icon(CupertinoIcons.phone),
                          Icon(CupertinoIcons.location_solid),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: [
                          Sans(15, "jushqinbekbekniyozov@gmail.com"),
                          Sans(15, "+99888 018 99 77"),
                          Sans(15, "Tashkent, Uzbekistan"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            //second section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold(35, "About me"),
                  Sans(15,
                      "Hello, I'm Jushkinbek, I specialize in Flutter Development"),
                  Sans(15,
                      "I've strive to ensure astounding performance with state of "),
                  Sans(15,
                      "the art security for Android, IOS, Web, Mac, Linux, Windows"),
                  SizedBox(
                    height: 10,
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
            SizedBox(
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold(35, "What I do?"),
                AnimatedCard(
                  imagePath: "assets/webL.png",
                  text: "Web Development",
                  width: 300,
                ),
                SizedBox(
                  height: 35,
                ),
                AnimatedCard(
                  imagePath: "assets/app.png",
                  text: "App Development",
                  width: 300,
                  fit: BoxFit.contain,
                  reverse: true,
                ),
                SizedBox(
                  height: 35,
                ),
                AnimatedCard(
                  imagePath: "assets/firebase.png",
                  text: "Back-End Development",
                  width: 300,
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
    
            //contact fourth section
            Form(
              key: formKey,
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  SansBold(35, "Contact me"),
                  TextForm(
                      text: "First Name",
                      Containerwidth: widthDevice / 1.4,
                      controller: _firstnameController,
                      hintText: "Please type your first name",
                      validator: (text){
                      if(text.toString().isEmpty){
                        return  "First name is required";
                      }
                    },
                      ),
                  TextForm(
                      text: "Last Name",
                      controller: _lastNameController,
                      Containerwidth: widthDevice / 1.4,
                      hintText: "Please type your last name"),
                  TextForm(
                      text: "Email",
                      controller: _emailController,
                      Containerwidth: widthDevice / 1.4,
                      hintText: "Please type your email address",
                      validator: (text){
                      if(text.toString().isEmpty){
                        return  "Email is required";
                      }
                    },
                      ),
                  TextForm(
                      text: "Phone Number",
                      controller: _phoneController,
                      Containerwidth: widthDevice / 1.4,
                      hintText: "Please type your phone number"),
                  TextForm(
                    text: "Message",
                    controller: _messageController,
                    validator: (text){
                      if(text.toString().isEmpty){
                        return  "Message is required";
                      }
                    },
                    Containerwidth: widthDevice / 1.4,
                    hintText: "Message",
                    maxLine: 10,
                  ),
                  MaterialButton(
                    onPressed: () async{
            
                        final addData = new AddDataFirestore();
                        logger.d(_firstnameController.text);
                        if(formKey.currentState!.validate()){
                          await addData.addResponse(_firstnameController.text, _lastNameController.text, _emailController.text, _phoneController.text, _messageController.text);
                         formKey.currentState!.reset();
                        DialogError(context);
                        
                        };
                      },
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    height: 60,
                    minWidth: widthDevice / 2.2,
                    color: Colors.tealAccent,
                    child: SansBold(20, "Submit"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            
          ],
        ),
      ),
    );
  }
}
