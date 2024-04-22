 import 'dart:convert';

import 'package:news_paper/model/news_model.dart';
import 'package:http/http.dart' as http;

 class ApiServices {

   final apiUrl = 'https://newsapi.org/v2/everything?q=keyword&apiKey=44618ae3eadc48879ab20d904a16e926';
   final topHeadLines = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=44618ae3eadc48879ab20d904a16e926';

   Future<List<NewsModel>> getNewsAll() async {
     try {
       http.Response response = await http.get(Uri.parse(apiUrl));
       if (response.statusCode == 200) {
         Map<String, dynamic> json = jsonDecode(response.body);
         List<dynamic> body = json['articles'];
         var articles =
         body.map((item) => NewsModel.fromJson(item)).toList();
         return articles;
       } else {
         throw Exception('Failed to load news: ${response.statusCode}');
       }
     } catch (e) {
       throw Exception('Failed to load news: $e');
     }
   }
   Future<List<NewsModel>> getTopHeadNewsAll() async {
     try {
       http.Response response = await http.get(Uri.parse(topHeadLines));
       if (response.statusCode == 200) {
         Map<String, dynamic> json = jsonDecode(response.body);
         List<dynamic> body = json['articles'];
         var articles =
         body.map((item) => NewsModel.fromJson(item)).toList();
         return articles;
       } else {
         throw Exception('Failed to load news: ${response.statusCode}');
       }
     } catch (e) {
       throw Exception('Failed to load news: $e');
     }
   }

 }