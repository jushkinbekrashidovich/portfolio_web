import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWeb extends StatefulWidget {
  final title;
  const TabsWeb(this.title, {super.key});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
                fontSize: 23.0,
              ),
        child: Text(
          widget.title,
          style: GoogleFonts.openSans(
            color: Colors.black,
          ),
        ),
      ),
    );
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
  final heading;
  final width;
  final hintText;
  final maxLine;
  const TextForm(
      {super.key,
      @required this.heading,
      @required this.width,
      @required this.hintText,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(16, heading),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            maxLines: maxLine == null ? null : maxLine,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2),
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

class AnimatedCardWeb extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  const AnimatedCardWeb(
      {super.key,
      @required this.imagePath,
      @required this.text,
      this.reverse,
      this.fit});

  @override
  State<AnimatedCardWeb> createState() => _AnimatedCardWebState();
}

class _AnimatedCardWebState extends State<AnimatedCardWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 4))..repeat(reverse: true);

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
                height: 200,
                width: 200,
                fit: widget.fit == null ? null : widget.fit,
              ),
              SizedBox(
                height: 10,
              ),
              SansBold(15, widget.text),
            ],
          ),
        ),
      ),
    );
  }
}
