import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;


class PrintProjects extends StatefulWidget {
  const PrintProjects({Key? key}) : super(key: key);

  @override
  _PrintProjectsState createState() => _PrintProjectsState();
}

class _PrintProjectsState extends State<PrintProjects> {
  List<String> title=[];
  List<String> lang=[];
  List<String> description=[];


  void _getDataFromGithub() async {
    final response = await http
        .get(Uri.parse('https://github.com/hamzajashari/'));
    dom.Document document = parse(response.body);
    final content =document.getElementsByClassName('pinned-item-list-item-content Truncate-text');
    final elements = document.getElementsByClassName('mr-2 text-bold ');


    setState(() {
      title = elements.map((elements) => elements.getElementsByTagName('span')[0].innerHtml).toList();
      description = content.map((content) => content.getElementsByTagName('p')[0].innerHtml).toList();
      lang = content.map((content) => content.getElementsByTagName('p')[1].getElementsByTagName('span')[0].getElementsByTagName('span')[1].innerHtml).toList();
    });
  }

  @override
  void initState() {
    _getDataFromGithub();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: title.length==0 ? Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Loading..." , textAlign: TextAlign.center,),
        ) : ListView.builder(
            itemCount : title.length,
              itemBuilder: (context,index){
              return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 300),
                  child: SlideAnimation(
                    child: GestureDetector(
                      onTap: () {
                        print("Tapped");
                      },
                      child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: Container(
                              color: Colors.white10,
                               child: Column(
                                 children: <Widget>[
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: Align(
                                       alignment: Alignment.center,
                                       child: Text(title[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          fontSize: 20
                                        ),),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Align(
                                       alignment: Alignment.centerLeft,
                                       child: Text(
                                         description[index],
                                         style: TextStyle(
                                           color: Colors.black,
                                         ),
                                       ),
                                     ),
                                   ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          lang[index],
                                          style: TextStyle(
                                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              );
              },
        ),
    );
  }
}
