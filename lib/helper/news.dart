import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{


  List<ArticleModel> news=[];
  Future<void> getNews() async{
    String url="https://newsapi.org/v2/top-headlines?country=in&apiKey=0a29ee8750914158b58eab4c105e792e";
  var response=await http.get(Uri.parse(url));
  var jsondata=jsonDecode(response.body);
    if(jsondata['status']=="ok"){
      jsondata["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null){
          ArticleModel articlemodel=ArticleModel(
            title: element["title"],
            author: element["author"],
            url: element["url"],
            uti: element["urlToImage"],
            desc: element["description"],
            content: element["content"]
          );
          news.add(articlemodel);


        }

      });
    }
  }

}
class CategoryNews{

  List<ArticleModel> news=[];
  Future<void> getCategoryNews(String cate) async{
    String url="https://newsapi.org/v2/top-headlines?country=in&category=${cate}&apiKey=0a29ee8750914158b58eab4c105e792e";
  var response=await http.get(Uri.parse(url));
  var jsondata=jsonDecode(response.body);
    if(jsondata['status']=="ok"){
      jsondata["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null){
          ArticleModel articlemodel=ArticleModel(
            title: element["title"],
            author: element["author"],
            url: element["url"],
            uti: element["urlToImage"],
            desc: element["description"],
            content: element["content"]
          );
          news.add(articlemodel);


        }

      });
    }
  }

}