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
  Color active = Colors.purple[400];
  Color inactive = Colors.purple[700];

  ScrollController _scrollAppBarControllerHome = new ScrollController();
  ScrollController _scrollAppBarControllerProducts = new ScrollController();
  ScrollController _scrollAppBarControllerMessages = new ScrollController();
  ScrollController _scrollAppBarControllerFavourites = new ScrollController();

  bool _searchSelected = false;

  int _screen=1;



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
    switch(_screen){
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;

    }
  }

  Widget navigationBar() {
    return Material(
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12)),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.chat_bubble,
                size: 30.0,
                color: _selectedItem == bottomIcons.post ? active : inactive,
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.home,
                size: 35.0,
                color: _selectedItem == bottomIcons.home ? active : inactive,
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.group,
                size: 35.0,
                color: _selectedItem == bottomIcons.study ? active : inactive,
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.search,
                size: 35.0,
                color: _selectedItem == bottomIcons.search ? active : inactive,
              ),
              title: Text('')),
          BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.account_circle,
                size: 35.0,
                color: _selectedItem == bottomIcons.profile ? active : inactive,
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
                _screen=0;
                _showAppbar = true;
                _searchSelected = false;
                isScrollingDown = false;

                break;
              case 1:
                _selectedItem = bottomIcons.home;
                _data = "Home";
                _screen=1;
                _showAppbar = true;
                _searchSelected = false;
                isScrollingDown = false;
                break;
              case 2:
                _selectedItem = bottomIcons.study;
                _data = "Create Study Group";
                _screen=2;
                _showAppbar = true;
                _searchSelected = false;
                isScrollingDown = false;
                break;
              case 3:
                _selectedItem = bottomIcons.search;
                _screen=3;
                _searchSelected = true;
                _showAppbar = true;
                isScrollingDown = false;
                break;
              case 4:
                _selectedItem = bottomIcons.profile;
                _screen=4;
                _data = "Account";
                _showAppbar = true;
                _searchSelected = false;
                isScrollingDown = false;
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
      resizeToAvoidBottomPadding: false,
      appBar: _showAppbar
          ? _AppBar()
          : PreferredSize(
              child: Container(),
              preferredSize: Size(0.0, 0.0),
            ),
      body: body(),
     drawer: Drawer(

        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(
            children: <Widget>[

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
                onTap: () {

                },
                child: ListTile(
                  title: Text("Log out"),
                  leading: Icon(
                    Icons.transit_enterexit,
                    color: Colors.purple,
                  ),
                ),
              ),
              Divider()
            ],
          ),
        ),
      ),
      bottomNavigationBar: navigationBar(),
    );
  }
}
