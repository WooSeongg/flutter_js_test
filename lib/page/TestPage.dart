import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html_v3/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

class TestPage extends StatelessWidget{

  Widget html = Container();
  String htmlString = '';

  TestPage({required String htmlString}){
    this.htmlString = htmlString;
    init();
  }

  void init(){

    //태그 정의
    CustomRenderMatcher btnMatcher() => (context) => context.tree.element?.localName == 'button';

    var styleVal = {
      "ul": Style(
          listStyleType: ListStyleType.none,
          padding: EdgeInsets.only(left: 10)
      ),
      "body": Style(
        backgroundColor: Colors.grey
      )


    };
    dom.Document document = htmlparser.parse(htmlString);
    html = Html.fromDom(
      document: document,
      style: styleVal,
      customRenders: {
        btnMatcher(): CustomRender.widget(widget: (context, buildChildren) => ElevatedButton(onPressed: (){}, child: Text("파싱한 값 넣기")))
      },
      tagsList: Html.tags..addAll(["button"]),
    );

  }


  @override
  Widget build(BuildContext context) {

    return Container(
          // color:Colors.green,
          child: html
    );
  }

}