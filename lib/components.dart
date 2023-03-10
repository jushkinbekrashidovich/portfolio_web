import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class TabsWeb extends StatefulWidget {
  final title;
  final route;

  const TabsWeb({
    super.key,
    this.title,
    this.route,
  });

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.openSans(
                  fontSize: 25.0,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  decorationThickness: 0.5,
                  decorationColor: Colors.black)
              : GoogleFonts.oswald(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
          child: Text(
            widget.title,
            style: GoogleFonts.openSans(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key, @required this.text, @required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 20.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: Colors.black,
        height: 50.0,
        minWidth: 200.0,
        child: Text(
          widget.text,
          style: GoogleFonts.openSans(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(widget.route);
        });
  }
}

class SansBold extends StatelessWidget {
  final String text;
  final double size;

  const SansBold(this.size, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.openSans(
          fontSize: size,
          fontWeight: FontWeight.bold,
        ));
  }
}

class Sans extends StatelessWidget {
  final String text;
  final double size;
  const Sans(this.size, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.openSans(
          fontSize: size,
        ));
  }
}

class TextForm extends StatelessWidget {
  final text;
  final Containerwidth;
  final hintText;
  final maxLine;
  final controller;
  final validator;
  const TextForm(
      {super.key,
      @required this.text,
      @required this.Containerwidth,
      @required this.hintText,
      this.maxLine,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(16, text),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          width: Containerwidth,
          child: TextFormField(
            validator: validator,
            controller: controller,
            maxLines: maxLine == null ? null : maxLine,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;
  const AnimatedCard(
      {super.key,
      @required this.imagePath,
      this.text,
      this.reverse,
      this.height,
      this.width,
      this.fit});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 4))
        ..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
          begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
          end: widget.reverse == true ? Offset.zero : Offset(0, 0.08))
      .animate(_controller);
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height == null ? 200 : widget.height,
                width: widget.width == null ? 200 : widget.width,
                fit: widget.fit == null ? null : widget.fit,
              ),
              SizedBox(
                height: 10,
              ),
              widget.text == null ? SizedBox() : SansBold(15, widget.text),
            ],
          ),
        ),
      ),
    );
  }
}

class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;

  const AbelCustom(
      {super.key,
      @required this.text,
      @required this.size,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color == null ? Colors.black : color,
        fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
      ),
    );
  }
}

class AddDataFirestore {
  var logger = Logger();
  CollectionReference response =
      FirebaseFirestore.instance.collection("messages");

  Future<void> addResponse(final firstName, final lastName, final email,
      final phoneNumber, final message) async {
    return response
        .add({
          'first name': firstName,
          'last name': lastName,
          'email': email,
          'phone_number': phoneNumber,
          'message': message,
        })
        .then((value) => logger.d("success"))
        .catchError((error) {
          logger.d(error);
        });
  }
}

Future DialogError(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: SansBold(20, "Submitted"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        );
      });
}
