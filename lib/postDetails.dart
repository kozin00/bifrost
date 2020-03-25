import 'package:bifrost/Tags.dart';
import 'package:bifrost/tagColor.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatefulWidget {
  final String name;
  final String image;
  final String post;
  final Tags type;
  final List<Tags> tags;

  PostDetails({this.name, this.image, this.post, this.tags, this.type});

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  String groupLink;
  String attachment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          elevation: 0.1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.purple,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(fontSize: 28),
                    )
                  ],
                ),
              ),
              Container(
                child: Text(widget.post, style: TextStyle(fontSize: 25)),
              ),
              Container(height: 35,width: MediaQuery.of(context).size.width,child: _showTags()),
              (attachment != null)
                  ? Container()

                  : Container(),
              (groupLink != null)
                  ? Material(
                      child: MaterialButton(
                        child: Text("Join Group"),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.purple,
                        size: 30.0,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.purple,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black54,
              ),
         //searchButton()
            ],
          ),
        ));
  }

  Widget _showTags() {
    List<Tags> outputList = List<Tags>();
    outputList.add(widget.type);
    outputList.addAll(widget.tags);
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: outputList.length,
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
                  width: 115,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      outputList[index].second,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
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

  Widget searchButton() {
    return Row(
      children: <Widget>[
        Material(
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
            child:  TextField(
                maxLines: null,
                decoration: InputDecoration(
                    hintText: "Search products", border: InputBorder.none),
                keyboardType: TextInputType.multiline,
              ),

          ),

        ),Material(
          color: Color(0xFFAF2BBF),
          child: MaterialButton(
            onPressed: (){},
          ),
        ),

      ],
    );
  }
}
