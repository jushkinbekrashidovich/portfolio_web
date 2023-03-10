import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_web/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
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
                  "assets/contact_image.jpg",
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              SansBold(40, "Contact me"),
              SizedBox(height: 20),
              Form(
                key: formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          controller: _firstnameController,
                          Containerwidth: 350,
                          text: "First Name",
                          validator: (text) {
                              if (text.toString().isEmpty) {
                                return "First name is required";
                              }
                            },
                          hintText: "Please type your first name",
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        TextForm(
                            controller: _emailController,
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Email is required";
                              }
                            },
                            text: "Email",
                            Containerwidth: 350,
                            hintText: "Please enter your email address"),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                            controller: _lastNameController,
                            text: "Last name",
                            
                            Containerwidth: 350,
                            hintText: "Please Enter your last name"),
                        SizedBox(
                          height: 15,
                        ),
                        TextForm(
                            controller: _phoneController,
                            
                            text: "Phone",
                            Containerwidth: 350,
                            hintText: "Please enter your phone number")
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextForm(
                text: "Message",
                
                controller: _messageController,
                validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Message is required";
                              }
                            },
                Containerwidth: widthDevice / 1.5,
                hintText: "Please type your message",
                
                maxLine: 10,
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: 60.0,
                minWidth: 200.0,
                color: Colors.tealAccent,
                child: SansBold(20.0, "Submit"),
                onPressed: () async {
                  final addData = new AddDataFirestore();
                  logger.d(_firstnameController.text);
                  if (formKey.currentState!.validate()) {
                    await addData.addResponse(
                        _firstnameController.text,
                        _lastNameController.text,
                        _emailController.text,
                        _phoneController.text,
                        _messageController.text);
                    formKey.currentState!.reset();
                    DialogError(context);
                  }
                  ;
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
