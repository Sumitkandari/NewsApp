
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'category_news.dart';

import 'article_view.dart';
//flutter run -d chrome --web-port=8080 --web-hostname=127.0.0.1


class Home extends StatefulWidget {
  

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category=new List<CategoryModel>();
  List<ArticleModel> articles=[];
  bool _loading=true;
  void initState(){
    super.initState();
    category=getCategories();
    getNews();

  }
  getNews() async{
    News newsClass=News();
    await newsClass.getNews();
    articles=newsClass.news;
    setState(() {
      _loading=false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text("News",style: TextStyle(letterSpacing:1.4,color: Colors.green[900],fontWeight: FontWeight.bold),)
          ],),
       // backgroundColor: Colors.red,
       
        elevation:0.0,
      ),
      body: _loading? Container(
        alignment: Alignment.center,
        child:CircularProgressIndicator(),
      ):SingleChildScrollView(

              child: Container(
                                    padding: EdgeInsets.symmetric(horizontal:6),

          child: Column(
            
            children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:6),
                    
                    height: 70,
                    child: ListView.builder(
                      itemCount: category.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return CategoryTile(imageURL:category[index].imageURL,categoryName:category[index].categoryName);
                      },

                    ),

                  ),
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

            ],),
        ),
      ),
      
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageURL,categoryName;
  CategoryTile({this.categoryName,this.imageURL});
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
          builder: (context)=>CatergorycNews(
          category:categoryName.toString().toLowerCase(),
        )));
        
      },
          child: Container(
        margin: const EdgeInsets.only(right:16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              
              child: Image(
                image:AssetImage(imageURL),
                width: 120,
                height: 60,
                fit: BoxFit.cover,),
              ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                        child: Container(
                alignment: Alignment.center,
                
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black38,
                ),

                child:Text( categoryName, style: TextStyle(color: Colors.white,letterSpacing: 1.5,fontWeight: FontWeight.bold),),
              ),
            )
            
          ],

        ),
      ),
    );
  }

}
class BlogTile extends StatelessWidget {
  final String imageURL,title,desc,articleURL;
  BlogTile({this.desc,@required this.imageURL,@required this.title,@required this.articleURL});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> ArticleView(articleURL:articleURL)
          )
           );
      },
          child: Container(
        margin: EdgeInsets.only(bottom:16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(imageURL)),
            Text(title,style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height:8.0),
            Text(desc,style: TextStyle(color: Colors.black54),),
          ],
        ),
      //  0a29ee8750914158b58eab4c105e792e
      ),
    );
  }
}