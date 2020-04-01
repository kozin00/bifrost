import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final String name;
  Chat({this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChatScreen(name: name,),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String name;
  ChatScreen({this.name});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String peerId;
  String id;

  var listMessage;
  String groupChatId;

  bool isLoading;

  final TextEditingController textEditingController =
      new TextEditingController();
  final ScrollController listScrollController = new ScrollController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           title: Center(
             child: Padding(
               padding: const EdgeInsets.only(right: 80.0),
               child: Text(widget.name),
             ),
           )),
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text("No Messages.", style: TextStyle(fontSize: 15),),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildInput(),
            ),
          )
        ],
      ),
    );
  }

  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 0.0),
              child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: 'Type your message...',
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  size: 30.0,
                ),
                onPressed: () {},
                color: Color(0xFFAF2BBF),
              ),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
