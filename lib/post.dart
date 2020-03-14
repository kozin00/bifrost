import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String type = "Mentor";
  List<String> types = ["Mentor", "Study Group"];
  String tagName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  : Container(height: 35, width: 400, child: _showTags()),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Color(0xFFAF2BBF),
            ),
            onPressed: () {
              addTag();
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
              ),
            ],
          );
        });
  }

  void addTag() {
    var alert = AlertDialog(
      content: Container(
        width: 300,
        height: 300,
        child: TagList(),
      ),
    );
    showDialog(context: context, builder: (_) => alert);
  }
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

  selectedTagsList.add(Tags(name: name, color: _tagColor));
}

class TagList extends StatefulWidget {
  @override
  _TagListState createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  List<String> fields = [
    "Math",
    "Engineering",
    "Science",
    "Business",
    "HASS",
    "Architecture",
    "Custom"
  ];
  String fieldsValue;

  final _formKey = new GlobalKey<FormState>();
  TextEditingController _tagName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white.withOpacity(0.8),
            elevation: 0.0,
            child: TextFormField(
                decoration:
                    InputDecoration(hintText: "Name", border: InputBorder.none),
                controller: _tagName,
                validator: (value) {
                  if (value.isEmpty) {
                    return "The name field cannot be empty";
                  }
                  if (value.length > 15) {
                    return "The name field cannot be longer than 15 characters";
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
                  FormState _formState = _formKey.currentState;
                  if (_formState.validate()) {
                    _addToTags(_tagName.text, fieldsValue);
                    Navigator.of(context).pop();
                  }
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
}

List<Tags> selectedTagsList = [];

class Tags {
  final String name;
  final Color color;

  Tags({this.name, this.color});
}
