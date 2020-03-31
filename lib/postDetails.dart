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
  List<String> commentsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0.1,
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,0,15.0,15.0),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: InkWell(
                      child: ListTile(
                        leading:  CircleAvatar(
                          backgroundColor: Colors.purple,
                          radius: 40,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            widget.name,
                            style: TextStyle(fontSize: 25),
                          ),
                        ) ,
                        subtitle: Text("2d", style: TextStyle(fontSize: 20),),
                      ),
                    )

                  ),
                  Container(
                    child: Text(widget.post, style: TextStyle(fontSize: 25)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width,
                      child: _showTags()),
                  SizedBox(
                    height: 20,
                  ),
                  (attachment != null) ? Container() : Container(),
                  (groupLink != null)
                      ? Material(
                          child: MaterialButton(
                            child: Text("Join Group"),
                          ),
                        )
                      : Container(),
                  Divider(
                    color: Colors.black54,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 135),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.purple,
                            size: 28.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.purple,
                            size: 28,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black54,
                  ),
                  comments(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: writeComment()),
              ),
            )
          ],
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

  Widget comments() {
    return (commentsList.length == 0)
        ? Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Center(
                child: Container(
              child: Text(
                "No comments.",
                style: TextStyle(fontSize: 20.0),
              ),
            )),
          )
        : ListView.builder(
            itemCount: commentsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text("Person"),
                      subtitle: Text("Post"),
                    ),
                    Divider(
                      color: Colors.black12,
                    )
                  ],
                ),
              );
            });
  }

  Widget writeComment() {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.black26,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextField(
            maxLines: null,
            textAlign: TextAlign.start,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
                hintText: "\tWrite a comment...", border: InputBorder.none),
            keyboardType: TextInputType.text,
          ),
        ),
      ),
    );
  }
}
