import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_paper/model/news_model.dart';
import 'package:news_paper/screens/news_details.dart';
import 'package:news_paper/services/api_service.dart';
import 'package:news_paper/widgets/horizental_item.dart';
import 'package:news_paper/widgets/news_item.dart';
import 'package:news_paper/widgets/test_item.dart';
import 'package:news_paper/widgets/vertical_divider.dart';
import '../constant/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'TREND NEWS',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          Icon(Icons.search),
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomVerticalDivider(),
                SizedBox(width: 10,),
                Text('Recent News',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(child: FutureBuilder(
            future: apiServices.getTopHeadNewsAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<NewsModel> articleList = snapshot.data ?? [];
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HorizontalItem(onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return NewsDetailsScreen(newsDetails: articleList[index]); // Replace YourNextScreen() with the widget for your next screen
                          },
                        ),
                      );

                    },article: articleList[index]);
                  },
                  itemCount: 10,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                CustomVerticalDivider(),
                SizedBox(width: 10,),
                Text('Top News',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 10,),

          Expanded(
            flex: 2,
              child: FutureBuilder(
                  future: apiServices.getNewsAll(), builder: (context, snapshot){
                if(snapshot.hasData){
                  List<NewsModel> articleTop = snapshot.data ?? [];
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                      return VerticalItemNews(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NewsDetailsScreen(newsDetails: articleTop[index]); // Replace YourNextScreen() with the widget for your next screen
                            },
                          ),
                        );
                      },article: articleTop[index]);
                    },
                    itemCount: articleTop.length,
                  ) ;
                }else{
                  return Center(child: CircularProgressIndicator(),);
                }
              })

          )
        ],
      )
    );

  }
}



