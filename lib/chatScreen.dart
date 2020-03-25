
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChatScreen(

      ),
    );
  }
}

class ChatScreen extends StatefulWidget {


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

  _ChatScreenState({this.peerId});





  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
backgroundColor: Color(0xFFAF2BBF),
        title: Text("Bruce Wayne")
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[

              buildInput(),
            ],
          ),

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
                onPressed: () {

                },
               color: Color(0xFFAF2BBF),
              ),
              color: Colors.white,
            ),
          )
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          border: new Border(top: BorderSide(color: Colors.grey, width: 0.5)),
          color: Colors.white),
    );
  }

}
