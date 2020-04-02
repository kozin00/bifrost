import 'package:bifrost/chatScreen.dart';
import 'package:bifrost/postDetails.dart';
import 'package:bifrost/tagColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Tags.dart';

class Profile extends StatefulWidget {
  final String name;

  Profile({this.name});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ScrollController _scrollController = new ScrollController();
  String _home = "";
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bool _favouriteIcon = false;
  Color mainTheme = Colors.purple;
  int count = 0;
  List<String> mentorTags = ["Bifrost", "i-Persist", "RCOS", "CS1"];
  final profilePageList = List<ProfilePage>.from(details)..addAll(posts);

  @override
  void initState() {
    super.initState();
    myScroll();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});

    super.dispose();
  }

  bool get _isAppBarNotExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  void myScroll() async {
    _scrollController.addListener(() {
      _isAppBarNotExpanded
          ? setState(() {
              _home = "";
            })
          : setState(() {
              _home = widget.name;
            });
    });

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
            _showAppbar = false;
          });
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          setState(() {
            isScrollingDown = false;
            _showAppbar = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    title: Center(
                        child: Text(
                      _home,
                      style: TextStyle(color: Colors.white),
                    )),
                    backgroundColor: mainTheme,
                    expandedHeight: 370.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        background: Container(
                            height: 300,
                            color: Colors.black,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 80,
                                ),
                                CircleAvatar(
                                  radius: 80,
                                ),
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontFamily: "Gotu"),
                                ),
                                Material(
                                  clipBehavior: Clip.antiAlias,
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      side: BorderSide(color: Colors.lightGreen[800])),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: 110,
                                    height: 35,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          CircleAvatar(
                                            radius: 5,
                                            backgroundColor: Colors.lightGreen[800],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Available",

                                            style: TextStyle(color: Colors.lightGreen[800], fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        CupertinoPageRoute(builder: (context) {
                                      return Chat(name: widget.name);
                                    }));
                                  },
                                  icon: Icon(
                                    Icons.mail,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                )
                              ],
                            ))),
                  ),
                ),
              ),
            ];
          },
          body: SizedBox(child: mainBody())),
    );
  }

  Widget mainBody() {
    return Column(
      children: <Widget>[
        Flexible(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: buildPost(posts),
        )),
      ],
    );
  }

  Widget buildPost(List<Post> posts) {
    return ListView.builder(
        itemCount: profilePageList.length,
        itemBuilder: (_, index) {
          print("count $index");
          final profilePageItem = profilePageList[index];
          if (profilePageItem is MentorDetails) {
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    height: 35.0,
                    color: Colors.white,
                    child: _buildMentorTags(mentorTags),
                  ),
                ),
                Divider(
                  color: Colors.black12,
                )
              ],
            );
          } else {
            index = index - 1;
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 12.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.purple,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                  width: 290,
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          widget.name,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Gotu"),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "2h",
                                            textAlign: TextAlign.left,
                                          ))
                                    ],
                                  )),
                              IconButton(
                                onPressed: () {},
                                color: Colors.grey,
                                icon: Icon(Icons.more_vert),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 40,
                            child: _buildTags(
                                posts[index].type, posts[index].tags)),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            return Navigator.push(context,
                                CupertinoPageRoute(builder: (context) {
                              return PostDetails(
                                name: widget.name,
                                image: posts[index].image,
                                post: posts[index].message,
                                tags: posts[index].tags,
                                type: posts[index].type,
                              );
                            }));
                          },
                          child: Container(
                            width: 400,
                            child: Text(posts[index].message,
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontFamily: "Baloo_Thambi_2",
                                ),
                                textAlign: TextAlign.start),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2, left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.comment,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text("2"),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text("1.2K"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  )
                ],
              ),
            );
          }
        });
  }

  Widget _buildTags(Tags type, List<Tags> tags) {
    List<Tags> outputList = List<Tags>();
    outputList.add(type);
    outputList.addAll(tags);
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: (index == 0)
                      ? primaryTagsColor(outputList[index].second)
                      : subTagsColor(outputList[index].first),
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      outputList[index].second,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              )
            ],
          );
        });
  }

  Widget _buildMentorTags(List<String> tags) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) {
          Color tagColor = mentorTagsColor(tags[index]);
          return Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: BorderSide(color: tagColor)),
                  child: Container(
                    color: Colors.white,
                    width: 100,
                    height: 35,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: tagColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            tags[index],
                            style: TextStyle(color: tagColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          );
        });
  }
}

////////////////////////////////////////////////////////////////////////////////////////////
List<Post> posts = [
  Post(
      type: Tags("", "Study Group"),
      message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
          "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
      tags: [
        Tags("HASS", "Journalism"),
        Tags("HASS", "Photography"),
        Tags("HASS", "Writing")
      ]),
  Post(
      type: Tags("", "Mentor"),
      message: "Ut enim ad minim veniam,"
          " quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat..... I'm Batman ",
      tags: [
        Tags("Engineering", "Chemical Engineering"),
        Tags(
          "Engineering",
          "Mech. Engineering",
        ),
        Tags(
          "Science",
          "Forensic Science",
        ),
        Tags(
          "Architecture",
          "Espionage",
        ),
        Tags("HASS", "Crime-Fighting")
      ]),
  Post(
      type: Tags("", "Study Group"),
      message: " Duis aute irure dolor in reprehenderit in voluptate velit "
          "esse cillum dolore eu fugiat nulla pariatur. ",
      tags: [
        Tags("Custom", "Sports"),
        Tags(
          "Science",
          "Forensic Science",
        ),
        Tags('Science', "Computer Science")
      ]),
  Post(
      type: Tags("", "Mentor"),
      message: "Ut enim ad minima veniam, quis nostrum exercitationem "
          "ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? "
          "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil"
          " molestiae consequatur,"
          " vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? ",
      tags: [
        Tags("Science", "Telepathy"),
        Tags(
          "Science",
          "Telekinesis",
        ),
        Tags('Science', "Psionics")
      ]),
  Post(
      type: Tags("", "Mentor"),
      message: "  Nemo enim ipsam voluptatem quia voluptas"
          " sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores "
          "eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui ",
      tags: [Tags("Engineering", "Aerodynamics"), Tags("Science", "Biology")]),
];

abstract class ProfilePage {}

class Post implements ProfilePage {
  final String image;
  final Tags type;
  final List<Tags> tags;
  final String message;

  Post({this.image, this.type, this.tags, this.message});
}

class MentorDetails implements ProfilePage {
  final Container container;

  MentorDetails(this.container);
}

List<MentorDetails> details = [MentorDetails(Container())];
