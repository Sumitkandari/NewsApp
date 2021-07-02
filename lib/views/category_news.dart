import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/home.dart';

class CatergorycNews extends StatefulWidget {
  final String category;
  CatergorycNews({this.category});
  

  @override
  _CatergorycNewsState createState() => _CatergorycNewsState();
}

class _CatergorycNewsState extends State<CatergorycNews> {
  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;
   void initState(){
    super.initState();
    getCategoryNews();
    

  }
  getCategoryNews() async{
    CategoryNews newsClass=CategoryNews();
    await newsClass.getCategoryNews(widget.category);
    articles=newsClass.news;
    setState(() {
      _loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text("News",style: TextStyle(letterSpacing:1.4,color: Colors.green[900],fontWeight: FontWeight.bold),)
          ],
          ),
          actions: <Widget>[
            Opacity(
              opacity:0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: Icon(Icons.save),))
          ],
       // backgroundColor: Colors.red,
       centerTitle: true,
        elevation:0.0
      ),
      body: _loading?Container(
        alignment: Alignment.center,
        child:CircularProgressIndicator(),
        ):SingleChildScrollView(
                child: Container(
            child:Column(children: <Widget>[
              Container(
                        padding: EdgeInsets.only(top: 16.0),
                        child:ListView.builder(
                          itemCount:articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder:(context,index){
                            return BlogTile(articleURL: articles[index].url,
                              imageURL: articles[index].uti,title: articles[index].title,desc: articles[index].desc,
                            );
                          }

                        ),
                      )

            ],)
          ),
        ),
      );
  
      
    
  }
}