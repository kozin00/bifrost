import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String type = "Mentor";
  List<String> types = ["Mentor", "Study Group"];
  String tagName = "";
  TextEditingController _tagname = new TextEditingController();
  List<String> fields = [
    "Math",
    "Engineering",
    "Science",
    "Business & Management",
    "HASS",
    "Architecture",
    "Custom"
  ];
  String fieldsValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
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
      child: Row(
        children: <Widget>[
          Text(
            'Tags:',
            style: TextStyle(fontSize: 20),
          ),
          Container(height: 200, width: 200, child: _showTags()),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Color(0xFFAF2BBF),
            ),
            onPressed: () {
              addTag();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Widget _showTags() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: selectedTagsList.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: selectedTagsList[index].color,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedTagsList[index].name,
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

  void addTag() {
    var alert = AlertDialog(
      content: Container(
        width: 300,
        height: 300,
        child: tagList(),
      ),
    );
    showDialog(context: context, builder: (_) => alert);
  }

  Widget tagList() {
    fieldsValue = fields[0];
    return ListView(
      children: <Widget>[
        TextFormField(
          controller: _tagname,
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
                value: fieldsValue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.black),
                onChanged: (String value) {
                  setState(() {
                    fieldsValue = value;
                  });
                },
                items: fields.map<DropdownMenuItem<String>>((String value) {
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
                  _addToTags(_tagname.text, fieldsValue);
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _addToTags(String name, String field) {
    Color _tagColor;
    switch (field) {
      case "Math":
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
      case "Business & Management":
        _tagColor = Colors.pink;
        break;
      default:
        _tagColor = Colors.grey;
        break;
    }

    setState(() {
      selectedTagsList.add(Tags(name: name, color: _tagColor));
    });
  }
}

List<Tags> selectedTagsList = [];

class Tags {
  final String name;
  final Color color;

  Tags({this.name, this.color});
}
