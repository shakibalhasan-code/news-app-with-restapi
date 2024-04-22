import 'package:flutter/material.dart';
import 'package:news_paper/model/news_model.dart';
import 'package:news_paper/widgets/vertical_divider.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsModel newsDetails;
  const NewsDetailsScreen({super.key, required this.newsDetails});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(newsDetails.urlToImage.toString()),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      // bottomLeft: Radius.circular(20),
                      // bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                  height: 200, // Ensure the gradient container covers the entire image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      // bottomLeft: Radius.circular(20),
                      // bottomRight: Radius.circular(20),
                    ),
                    gradient: const LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 15,
                  right: 8,
                  child: Text(
                    '${newsDetails.title.toString()}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.person,color: Colors.green,),
                          Text('${newsDetails.author}',style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      CustomVerticalDivider(),
                      Column(
                        children: [
                          Icon(Icons.source_rounded,color: Colors.green,),
                          Text('${newsDetails.source?.name}',style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 5 ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))
                  ),
                  child:Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        SizedBox(height: 5,),
                        Container(
                      width: double.infinity,
                      height: 1,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)
                      ),),
                        SizedBox(height: 10,),
                        Text(newsDetails.description.toString()),
                        SizedBox(height: 15,),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(Icons.forward,color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Text('More Info: ${newsDetails.source?.name}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
