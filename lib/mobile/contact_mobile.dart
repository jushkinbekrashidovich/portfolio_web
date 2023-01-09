import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {

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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
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
    
     body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 400,

            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 35,

            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/contact_image.jpg",
              fit: BoxFit.cover,
              ),
            ),
          ),
          
        ];
      } ,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 25, ),
        child: Form(
          key: formKey,
          child: Wrap(
              runSpacing: 20,
              spacing: 20,
              alignment: WrapAlignment.center,
              children: [
                SansBold(35, "Contact me"),
                TextForm(
                    text: "First Name",
                    controller: _firstnameController,
                    Containerwidth: widthDevice / 1.4,
                    validator: (text){
                      if(text.toString().isEmpty){
                        return  "First name is required";
                      }
                    },
                    hintText: "Please type your first name"),
                TextForm(
                    text: "Last Name",
                    controller: _lastNameController,
                    Containerwidth: widthDevice / 1.4,
                    hintText: "Please type your last name"),
                TextForm(
                    text: "Email",
                    controller: _emailController,
                    Containerwidth: widthDevice / 1.4,
                    validator: (text){
                      if(text.toString().isEmpty){
                        return  "Email is required";
                      }
                    },
                    hintText: "Please type your email address"),
                TextForm(
                    text: "Phone Number",
                    controller: _phoneController,
                    Containerwidth: widthDevice / 1.4,
                    hintText: "Please type your phone number"),
                    
                TextForm(
                  text: "Message",
                  controller: _messageController,
                  Containerwidth: widthDevice / 1.4,
                  hintText: "Message",
                  validator: (text){
                      if(text.toString().isEmpty){
                        return  "Message is required";
                      }
                    },
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

      ),
      ),
     );
    
  }
}