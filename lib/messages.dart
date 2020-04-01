import 'package:bifrost/chatScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: Text("Messages"),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: messageTiles(),
      ),
    );
  }
}

Widget messageTiles() {
  return (messagesList.length == 0)
      ? Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: Text(
                "No Messages.",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        )
      : ListView.builder(itemCount: messagesList.length,itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context){
                          return Chat(name: messagesList[index].name,);
                        }));
                      },
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text(
                        messagesList[index].name,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.black38)
              ],
            ),
          );
        });
}

List<Message> messagesList = [
  Message(name: "Eminem", image: ""),
  Message(
    name: "Michael Jackson",
    image: "",
  ),
  Message(
    name: "Lionel Messi",
    image: "",
  ),
];

class Message {
  final String name;
  final String image;

  Message({this.name, this.image});
}
