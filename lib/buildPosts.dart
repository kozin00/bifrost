import 'package:bifrost/Tags.dart';
import 'package:bifrost/postDetails.dart';
import 'package:bifrost/tagColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bifrost/home.dart';

Widget buildPost(List<Post> posts, BuildContext context) {
  return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 12.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.purple,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                              width: 290,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      posts[index].name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Gotu"),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "2h",
                                        textAlign: TextAlign.left,
                                      ))
                                ],
                              )),
                          IconButton(
                            onPressed: () {},
                            color: Colors.grey,
                            icon: Icon(Icons.more_vert),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 40,
                        child:
                        _buildTags(posts[index].type, posts[index].tags)),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        return Navigator.push(context,
                            CupertinoPageRoute(builder: (context) {
                              return PostDetails(
                                name: posts[index].name,
                                image: posts[index].image,
                                post: posts[index].message,
                                tags: posts[index].tags,
                                type: posts[index].type,
                              );
                            }));
                      },
                      child: Container(
                        width: 400,
                        child: Text(posts[index].message,
                            style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: "Baloo_Thambi_2",
                            ),
                            textAlign: TextAlign.start),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 10.0),
                      child: Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.comment,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text("2"),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text("1.2K"),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black38,
              )
            ],
          ),
        );
      });
}

Widget _buildTags(Tags type, List<Tags> tags) {
  List<Tags> outputList = List<Tags>();
  outputList.add(type);
  outputList.addAll(tags);
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tags.length,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    outputList[index].second,
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

class Post {
  final String name;
  final String image;
  final Tags type;
  final List<Tags> tags;
  final String message;

  Post({this.name, this.image, this.type, this.tags, this.message});
}
