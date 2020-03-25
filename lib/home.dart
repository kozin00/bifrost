import 'package:bifrost/Tags.dart';
import 'package:bifrost/messages.dart';
import 'package:bifrost/postDetails.dart';
import 'package:bifrost/tagColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:tuple/tuple.dart';
import 'package:bifrost/post.dart' as post;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bool _profileSelected = false;
  bool _searchSelected = false;

  String _data = "Home";

  //Color active = Color(0xFFAF2BBF);

  Color iconColor = Colors.purple[700];
  Color secondPurple = Color(0xFFAF2BBF);
  ScrollController _scrollAppBarControllerHome = new ScrollController();
  ScrollController _scrollAppBarControllerProducts = new ScrollController();
  ScrollController _scrollAppBarControllerMessages = new ScrollController();
  ScrollController _scrollAppBarControllerFavourites = new ScrollController();

  int _screen = 1;

  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey();
  List<Color> tagColors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.grey,
    Colors.blue,
    Colors.pink
  ];

  @override
  void initState() {
    super.initState();
    myScroll();
  }

  @override
  void dispose() {
    _scrollAppBarControllerHome.removeListener(() {});
    _scrollAppBarControllerProducts.removeListener(() {});
    _scrollAppBarControllerMessages.removeListener(() {});
    _scrollAppBarControllerFavourites.removeListener(() {});
    super.dispose();
  }

  void myScroll() async {
    _scrollAppBarControllerHome.addListener(() {
      if (_scrollAppBarControllerHome.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
            _showAppbar = false;
          });
        }
      }
      if (_scrollAppBarControllerHome.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          setState(() {
            isScrollingDown = false;
            _showAppbar = true;
          });
        }
      }
    });

    _scrollAppBarControllerProducts.addListener(() {
      if (_scrollAppBarControllerProducts.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
            _showAppbar = false;
          });
        }
      }
      if (_scrollAppBarControllerProducts.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          setState(() {
            isScrollingDown = false;
            _showAppbar = true;
          });
        }
      }
    });

    _scrollAppBarControllerMessages.addListener(() {
      if (_scrollAppBarControllerMessages.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
            _showAppbar = false;
          });
        }
      }
      if (_scrollAppBarControllerMessages.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          setState(() {
            isScrollingDown = false;
            _showAppbar = true;
          });
        }
      }
    });

    _scrollAppBarControllerFavourites.addListener(() {
      if (_scrollAppBarControllerFavourites.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
            _showAppbar = false;
          });
        }
      }
      if (_scrollAppBarControllerFavourites.position.userScrollDirection ==
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

  List<Post> posts = [
    Post(
        name: "Clark Kent",
        type: Tags("", "Study Group"),
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
        tags: [
          Tags("HASS", "Journalism"),
          Tags("HASS", "Photography"),
          Tags("HASS", "Writing")
        ]),
    Post(
        name: "Bruce Wayne",
        type: Tags("", "Mentor"),
        message: "Ut enim ad minim veniam,"
            " quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat..... I'm Batman ",
        tags: [
          Tags("Engineering", "Chemical Engineering"),
          Tags(
            "Engineering",
            "Mechanincal Engineering",
          ),
          Tags(
            "Science",
            "Forensic Science",
          ),
          Tags(
            "Architecture",
            "Crime-Fighting",
          ),
          Tags("HASS", "Crime-Fighting")
        ]),
    Post(
        name: "Barry Allen",
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
        name: "Jon Jonzz",
        type: Tags("", "Mentor"),
        message: " Duis aute irure dolor in reprehenderit in voluptate velit "
            "esse cillum dolore eu fugiat nulla pariatur. ",
        tags: [
          Tags("Science", "Telepathy"),
          Tags(
            "Science",
            "Telekinesis",
          ),
          Tags('Science', "Psionics")
        ]),
    Post(
        name: "Shayera",
        type: Tags("", "Mentor"),
        message: " Duis aute irure dolor in reprehenderit in voluptate velit "
            "esse cillum dolore eu fugiat nulla pariatur. ",
        tags: [
          Tags("Engineering", "Aerodynamics"),
          Tags("Science", "Biology")
        ]),
  ];

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

  Widget _buildPost(List<Post> posts) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12.0, right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return PostDetails(
                    name: posts[index].name,
                    image: posts[index].image,
                    post: posts[index].message,
                    tags: posts[index].tags,
                    type: posts[index].type,
                  );
                }));
              },
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
                              Text(
                                posts[index].name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "2d",
                                textAlign: TextAlign.right,
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
                        Container(
                          width: 400,
                          child: Text(
                            posts[index].message,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.comment,
                                  color: Colors.grey,
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
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text("1.2K"),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _appBar() {
    if (_searchSelected) {
      return searchBar();
    } else {
      return AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0.1,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.purpleAccent, Colors.purple[700]])),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Center(
            child: Text(
              _data,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.local_post_office, color: Colors.white),
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return Messages();
              }));
            },
          )
        ],
      );
    }
  }

  Widget body() {
    switch (_screen) {
      case 1:
        return _buildPost(posts);
        break;
      case 2:
        break;
      case 3:
        break;
    }
    return null;
  }

  Widget navigationBar() {
    return Material(
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12)),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.chat_bubble,
                  size: 30.0,
                  color: iconColor,
                ),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.home,
                  size: 30.0,
                  color: iconColor,
                ),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.group,
                  size: 30.0,
                  color: iconColor,
                ),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.search,
                  size: 30.0,
                  color: iconColor,
                ),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.menu,
                  size: 30.0,
                  color: iconColor,
                ),
              ),
              title: Text(''))
        ],
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            int current = index;
            switch (current) {
              case 0:
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => post.Post()));
                break;
              case 1:
                _data = "Home";
                _screen = 1;
                _profileSelected = false;
                _showAppbar = true;
                _searchSelected = false;
                isScrollingDown = false;
                break;
              case 2:
                _data = "Create Study Group";
                _screen = 2;
                _profileSelected = false;
                _showAppbar = true;
                _searchSelected = false;
                isScrollingDown = false;
                break;
              case 3:
                _screen = 3;
                _profileSelected = false;
                _searchSelected = true;
                _showAppbar = true;
                isScrollingDown = false;
                break;
              case 4:
                _profileSelected = true;
                _scaffoldkey.currentState.openEndDrawer();
                break;
            }
          });
        },
      ),
    );
  }

  Widget searchBar() {
    return PreferredSize(
      preferredSize: Size(0, 100),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.black12,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: secondPurple,
                    size: 32,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Search products", border: InputBorder.none),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: secondPurple,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      resizeToAvoidBottomPadding: false,
      appBar: _showAppbar
          ? _appBar()
          : PreferredSize(
              child: Container(),
              preferredSize: Size(0.0, 0.0),
            ),
      body: body(),
      endDrawer: (_profileSelected)
          ? Drawer(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                          Colors.purpleAccent,
                          Colors.purple[700]
                        ])),
                    child: Container(
                      height: 23,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                          Colors.purpleAccent,
                          Colors.purple[700]
                        ])),
                    child: InkWell(
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Become a mentor",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[600],
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  InkWell(
                    child: ListTile(
                      title: Text("Account"),
                      leading: Icon(Icons.account_circle),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  InkWell(
                    child: ListTile(
                      title: Text("Study Groups"),
                      leading: Icon(Icons.group_add),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  InkWell(
                    child: ListTile(
                      title: Text("Mentors"),
                      leading: Icon(Icons.person),
                      onTap: () {},
                    ),
                  ),
                  Divider(),
                  InkWell(
                    child: ListTile(
                      title: Text("Backtests"),
                      leading: Icon(Icons.library_books),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    child: ListTile(
                      title: Text("Settings"),
                      leading: Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 320,
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("Log out"),
                      leading: Icon(
                        Icons.transit_enterexit,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : PreferredSize(
              preferredSize: Size(0, 0),
            ),
      bottomNavigationBar: SizedBox(height: 75, child: navigationBar()),
    );
  }
}

class Post {
  final String name;
  final String image;
  final Tags type;
  final List<Tags> tags;
  final String message;

  Post({this.name, this.image, this.type, this.tags, this.message});
}
