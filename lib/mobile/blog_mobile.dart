import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components.dart';

class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  // List title = ["Who is Dash?", "Who is Dash1"];
  // List body = ["Well, we can all read about it in google", "Google it"];
  void article() async {
    await FirebaseFirestore.instance
        .collection("articles")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        //print(element.data()['title']);
      });
    });
  }

  void streamArticle() async {
    await for (var snapshot
        in FirebaseFirestore.instance.collection("articles").snapshots()) {
      for (var title in snapshot.docs) {
        print(title.data()['title']);
      }
    }
    ;
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   article();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                          await launchUrl(Uri.parse(
                              "https://github.com/jushkinbekrashidovich"));
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
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 400,
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(
                      color: Colors.black,
                      size: 35,
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: AbelCustom(
                          text: "Welcome to my Blog",
                          size: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      background: Image.asset(
                        "assets/blog.jpg",
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                      // expandedTitleScale: 600,
                    ),
                  ),
                ];
              },
              body: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("articles")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return BlogPost(
                                title: documentSnapshot["title"],
                                body: documentSnapshot["body"]);
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            )));
  }
}

class BlogPost extends StatefulWidget {
  final title;
  final body;

  const BlogPost({super.key, @required this.title, @required this.body});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 30, right: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
                style: BorderStyle.solid, width: 1, color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: AbelCustom(
                    text: widget.title.toString(),
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        expand = !expand;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.black,
                    ))
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              widget.body.toString(),
              style: GoogleFonts.openSans(fontSize: 15),
              maxLines: expand == true ? null : 3,
              overflow:
                  expand == true ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
