import 'package:bifrost/Tags.dart';
import 'package:bifrost/profile.dart';
import 'package:bifrost/tagColor.dart';
import 'package:flutter/cupertino.dart';
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
    groupLink = "calculus";
    return Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        appBar: AppBar(
          backgroundColor: Color(0xFFF9F9F9),
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
            ListView(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: InkWell(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.purple,
                          radius: 40,
                        ),
                        title: InkWell(
                          onTap: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (context){
                              return Profile(name: widget.name);
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Gotu",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        subtitle: Text(
                          "2d",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0,0.0,15.0,15.0),
                  child: Container(
                    child: Text(
                      widget.post,
                      style:
                      TextStyle(fontSize: 25, fontFamily: "Baloo_Thambi_2"),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0.0,0.0,5.0),
                  child: Container(
                      height: 35,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: _showTags()),
                ),
                SizedBox(
                  height: 20,
                ),
                (attachment != null) ? Container() : Container(),
                (groupLink != null)
                    ? Padding(
                  padding: const EdgeInsets.fromLTRB(15.0,10.0,20.0,15.0),
                  child: Material(
                    color: Color(0xFFAF2BBF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        "Join Group",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Gotu",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
                    : Container(),
                Divider(
                  color: Colors.black38,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
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
                Container(
                  height: commentsList.length*110.toDouble(),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                    child: comments(),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
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
        ? Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Center(
          child: Text(
            "No comments.",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    )
        : ListView.builder(
        itemCount: commentsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(),
                  title: Text(commentsList[index].name, style: TextStyle(fontSize: 18),),
                  subtitle: Text(commentsList[index].comment, style: TextStyle(fontSize: 15),),
                  trailing: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.favorite,
                    color: Colors.purple,),
                  ),
                ),
                Divider(
                  color: Colors.black12
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

List<Comment> commentsList = [
  Comment(name: "Eminem", image: "", comment: "Guess who's back"),
  Comment(name: "Michael Jackson", image: "", comment: "Annie are you okay?"),
  Comment(name: "Lionel Messi",
      image: "",
      comment: "I let my football do the talking"),

];

class Comment {
  final String name;
  final String image;
  final String comment;

  Comment({this.name, this.image, this.comment});
}
