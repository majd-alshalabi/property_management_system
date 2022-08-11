import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
   CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
List <String>Comments =[];

void addComments(String val){
  setState(() {
    Comments.add(val);  
  });

  Widget BuildCommentsList(){
    return ListView.builder(itemBuilder: (context, index) {
      if(index <Comments.length){
        return BuildCommentsList();
      }
    }));
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Comments",style: TextStyle(fontSize: 20.0,color: Colors.black45),),
      ),
      body: ,
    );
  }
}
