import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_paper/model/news_model.dart';

class TextItem extends StatelessWidget {
  final NewsModel article;

  const TextItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5),
      child: SizedBox(
        height: 250,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage.toString()),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
                '${article.title.toString()}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



