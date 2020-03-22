import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String type = "Mentor";
  List<String> types = ["Mentor", "Study Group"];
  String tagName = "";
  bool maxTags = false;
  List<String> fields = [
    "Mathematics",
    "Engineering",
    "Science",
    "Business & MGMT",
    "HASS",
    "Architecture",
    "Custom"
  ];

  bool dialog = false;
  final _formKey = new GlobalKey<FormState>();
  TextEditingController _tagName = new TextEditingController();

  String selectedGroup = " ";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            selectedTagsList.clear();
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 8.0),
            child: Material(
              borderRadius: BorderRadius.circular(80),
              clipBehavior: Clip.antiAlias,
              color: Color(0xFFAF2BBF),
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Post",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
      body: Body(),
    );
  }

  ListView Body() {
    return ListView(
      children: <Widget>[selectType(), selectTags()],
    );
  }

  Padding selectType() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 15.0),
      child: Row(
        children: <Widget>[
          Text(
            'Type:',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 20.0,
          ),
          DropdownButton<String>(
              value: type,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              onChanged: (String value) {
                setState(() {
                  type = value;
                });
              },
              items: types.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(value, style: TextStyle(fontSize: 20)),
                  ),
                );
              }).toList())
        ],
      ),
    );
  }

  Padding selectTags() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Tags:',
                style: TextStyle(fontSize: 20),
              ),
              (selectedTagsList.length == 0)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                          height: 35,
                          width: (selectedTagsList.length * 130).toDouble(),
                          child: _showTags()),
                    ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Color(0xFFAF2BBF),
                ),
                onPressed: () {
                  if (selectedTagsList.length < 2) {
                    addTag();
                  }
                },
              )
            ],
          ),
          (selectedTagsList.length >= 2)
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      "Maximum number of tags is 2.",
                      style: TextStyle(color: Colors.red[400]),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  void _removeTag(int index, String name) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                content: Text("Remove $name from tags?"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        selectedTagsList.removeAt(index);
                      });

                      Navigator.of(context).pop();
                    },
                    child: Text("Yes"),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("No"),
                  )
                ],
              );
            },
          );
        });
  }

  Widget _showTags() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: selectedTagsList.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  _removeTag(index, selectedTagsList[index].name);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: selectedTagsList[index].color,
                    height: 35,
                    width: 115,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectedTagsList[index].name,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          );
        });
  }

  void addTag() {
    String fieldValue = fields[0];
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.white,
                width: 300,
                height: 161,
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.8),
                        elevation: 0.0,
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Name", border: InputBorder.none),
                            controller: _tagName,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The name field cannot be empty";
                              }
                              if (value.length > 15) {
                                return "The name cannot have more than 14 characters";
                              } else {
                                if (value.length < 2) {
                                  return "The name must have more than 2 characters";
                                }
                              }
                              return null;
                            }),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Tags:',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        DropdownButton<String>(
                            value: fieldValue,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            onChanged: (String value) {
                              setState(() {
                                fieldValue = value;
                              });
                            },
                            items: fields
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(value,
                                      style: TextStyle(fontSize: 20)),
                                ),
                              );
                            }).toList())
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Material(
                          borderRadius: BorderRadius.circular(80),
                          clipBehavior: Clip.antiAlias,
                          color: Color(0xFFAF2BBF),
                          child: MaterialButton(
                            onPressed: () {
                              FormState _formState = _formKey.currentState;
                              if (_formState.validate()) {
                                Color _tagColor = addToTags(fieldValue);
                                setState(() {
                                  selectedTagsList.add(Tags(
                                      name: _tagName.text, color: _tagColor));
                                });
                                _tagName.clear();
                                Navigator.of(context).pop();
                              }
                            },
                            child: Text(
                              "Add",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
          );
        });
  }

  Padding _attachLink() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Attach Group Link:',
                style: TextStyle(fontSize: 20),
              ),
              (myGroups.length == 0 || selectedGroup == " ")
                  ? IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Color(0xFFAF2BBF),
                      ),
                      onPressed: () {
                        addLink();
                      },
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(height: 35, child: Text(selectedGroup)),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  void addLink() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                  width: 300,
                  height: 300,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: ListView.builder(
                            itemCount: myGroups.length,
                            itemBuilder: (context, index) {
                              return Radio();
                            }),
                      ),
                      FlatButton(
                        color: Colors.purple,
                        child: Text("Create Group"),
                      )
                    ],
                  ));
            }),
          );
        });
  }

  Color addToTags(String field) {
    Color _tagColor;
    switch (field) {
      case "Mathematics":
        _tagColor = Colors.red;
        break;
      case "Science":
        _tagColor = Colors.green;
        break;
      case "Engineering":
        _tagColor = Colors.blue[900];
        break;
      case "HASS":
        _tagColor = Colors.orange;
        break;
      case "Architecture":
        _tagColor = Colors.yellowAccent;
        break;
      case "Business & MGMT":
        _tagColor = Colors.pink;
        break;
      default:
        _tagColor = Colors.grey;
        break;
    }

    return _tagColor;
  }
}

List<Tags> selectedTagsList = [];
List<Groups> myGroups = [];

class Tags {
  final String name;
  final Color color;

  Tags({this.name, this.color});
}

class Groups {
  final String name;
  final String link;

  Groups({this.name, this.link});
}
