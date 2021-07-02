import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  
final String articleURL;
ArticleView({this.articleURL});


  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer=Completer<WebViewController>();
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
        elevation:0.0,
        ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
        child:WebView(
          initialUrl: widget.articleURL,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          } ),

        )
        
      ),
    );
  }
}