import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js_test/page/TestPage.dart';

void main() async{


  // String htmlPath = 'assets/document/flutter.html';
  // String htmlString =  await rootBundle.loadString(htmlPath);

  runApp(const MyApp());

}

Future<String> getHtmlString() async{

  String htmlPath = 'assets/document/flutter.html';
  String htmlString = await rootBundle.loadString(htmlPath);

  return htmlString;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: Scaffold(
        body:FutureBuilder(
          future: getHtmlString(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                )
              );
            }else if (snapshot.hasError){
              print("@@@@@@ @@@@@@");
              print("에러발생 @@@@@@");
              print("@@@@@@ @@@@@@");
              return Container();
            }
            else{
              return TestPage(htmlString: snapshot.data as String);
            }
          },
        ),
      )
    );
  }
}
