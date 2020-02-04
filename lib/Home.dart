import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum bottomIcons { post, study, home, search, profile }

class _HomePageState extends State<HomePage> {
  var current = 0;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bottomIcons _selectedItem = bottomIcons.home;

  String _data = "Home";
  Color primaryColor = Colors.purpleAccent[200];
  Color active = Color(0xFFF038FF);
  Color inactive = Colors.purple[700];

  ScrollController _scrollAppBarControllerHome = new ScrollController();
  ScrollController _scrollAppBarControllerProducts = new ScrollController();
  ScrollController _scrollAppBarControllerMessages = new ScrollController();
  ScrollController _scrollAppBarControllerFavourites = new ScrollController();

  bool _searchSelected = false;

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
        type: "Study Group",
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
        tags: ["Journalism, Photography, Writing"]),
    Post(
        name: "Bruce Wayne",
        type: "Mentor",
        message: "Ut enim ad minim veniam,"
            " quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat..... I'm Batman ",
        tags: [
          "Chemical Engineering, Mechanincal Engineering, Forensic Science, Crime-Fighting, Art of Deduction"
        ]),
    Post(
        name: "Princess Diana",
        type: "Study Group",
        message: " Duis aute irure dolor in reprehenderit in voluptate velit "
            "esse cillum dolore eu fugiat nulla pariatur. ",
        tags: ["Royal Manners, Lie Detection"]),
  ];

  Widget _buildTags(List<String> tags) {
    var rndcolor = new Random();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Material(
            child: Container(
              child: Text(tags[index]),
              color: tagColors[rndcolor.nextInt(tagColors.length)],
            ),
          );
        });
  }

  Widget _buildPost(List<Post> posts) {
    print("Opened function");
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, index) {
          print("Opened");

          return Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        Text(posts[index].name),
                        Text("2d")
                      ],
                    ),
                    _buildTags(posts[index].tags),
                    Container(
                      width: 100,
                      child: Text(posts[index].message),
                    ),
                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.comment,
                              color: Colors.grey,
                            ),
                            Text("2")
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
                            Text("1.2K")
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
              )
            ],
          );
        });
  }

  Widget _AppBar() {
    if (_searchSelected) {
      return PreferredSize(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(2, 1), blurRadius: 5)
                ]),
            child: ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.purpleAccent[400],
              ),
              title: TextField(
                decoration: InputDecoration(
                    hintText: "Search study groups or people...",
                    border: InputBorder.none),
              ),
            ),
          ),
        ),
        preferredSize: Size(50, 100),
      );
    } else {
      return AppBar(
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
          )
        ],
      );
    }
  }

  Widget body() {
    switch (_screen) {
      case 0:

        break;
      case 1:
        return _buildPost(posts);

        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
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
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.chat_bubble,
                  size: 30.0,
                  color: _selectedItem == bottomIcons.post ? active : inactive,
                ),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.home,
                  size: 30.0,
                  color: _selectedItem == bottomIcons.home ? active : inactive,
                ),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.group,
                  size: 30.0,
                  color: _selectedItem == bottomIcons.study ? active : inactive,
                ),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.search,
                  size: 30.0,
                  color:
                      _selectedItem == bottomIcons.search ? active : inactive,
                ),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.menu,
                  size: 30.0,
                  color:
                      _selectedItem == bottomIcons.profile ? active : inactive,
                ),
              ),
              title: Text(''))
        ],
        currentIndex: current,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            current = index;
            switch (current) {
              case 0:
                _selectedItem = bottomIcons.post;
                _data = "Post";
                _screen = 0;
                _showAppbar = true;
                _searchSelected = false;
                isScrollingDown = false;

                break;
              case 1:
                _selectedItem = bottomIcons.home;
                _data = "Home";
                _screen = 1;
                _showAppbar = true;
                _searchSelected = false;
                isScrollingDown = false;
                break;
              case 2:
                _selectedItem = bottomIcons.study;
                _data = "Create Study Group";
                _screen = 2;
                _showAppbar = true;
                _searchSelected = false;
                isScrollingDown = false;
                break;
              case 3:
                _selectedItem = bottomIcons.search;
                _screen = 3;
                _searchSelected = true;
                _showAppbar = true;
                isScrollingDown = false;
                break;
              case 4:
                _selectedItem = bottomIcons.profile;
                _scaffoldkey.currentState.openEndDrawer();
                break;
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      key: _scaffoldkey,
      resizeToAvoidBottomPadding: false,
      appBar: _showAppbar
          ? _AppBar()
          : PreferredSize(
              child: Container(),
              preferredSize: Size(0.0, 0.0),
            ),
      body: body(),
      endDrawer: (_selectedItem == bottomIcons.profile)
          ? Drawer(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ListView(
                  children: <Widget>[
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
                      height: 370,
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
  final String type;
  final List<String> tags;
  final String message;

  Post({this.name, this.image, this.type, this.tags, this.message});
}
