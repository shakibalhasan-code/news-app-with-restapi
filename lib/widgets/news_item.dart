import 'package:flutter/material.dart';
import 'package:news_paper/model/news_model.dart';

class VerticalItemNews extends StatelessWidget {
  final NewsModel article;
  final VoidCallback onTap;
  const VerticalItemNews({super.key, required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
          padding: EdgeInsets.only(top: 5,right: 10,left: 10),
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(article.title.toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                            maxLines: 2,
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(left: 8,right: 8,top: 3,bottom: 3),
                                child: Text('Author: ${article.author.toString()}',style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),maxLines: 1,)),
                          )
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10,top: 5,bottom: 5),
                      child: Container(
                        height: double.infinity,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                            image: DecorationImage(
                                image: NetworkImage(article.urlToImage.toString()),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ))
              ],
            ),
          )
      ),
    );
  }
}

