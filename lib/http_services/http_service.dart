
import 'dart:convert';

import 'package:client_update/models/models.dart';
import 'package:http/http.dart';

class HttpService {
  Future<List<GrammerLessonCategory>> fetchCategories() async {
    List<GrammerLessonCategory> categories = [];
    var data = await get("https://nestjs-now-inky.vercel.app/api/users/categories");
    // print(data.statusCode);
    var jsonData = json.decode(data.body);

    for (var d in jsonData) {
      GrammerLessonCategory category =
          GrammerLessonCategory(d['name'], d['description']);
      categories.add(category);
    }

    return categories;
    // print(categories);
  }

  Future<List<GrammerLessonsByTitle>> fetchGrammerLessonsByCategory(category) async{
    List<GrammerLessonsByTitle> lessonsBytitles = [];

  var data = await get("https://nestjs-now-inky.vercel.app/api/users/grammer?category=$category");
  var jsonData = json.decode(data.body);

  for(var d in jsonData){
    GrammerLessonsByTitle lesson = GrammerLessonsByTitle(d["title"],d["content"]);
    lessonsBytitles.add(lesson);
  }

  return lessonsBytitles;
  }

  Future<List<VocabularyCategory>> fetchVocabularyCategories()async{
    List<VocabularyCategory> vocCategories = [];
    var data = await get("https://nestjs-now-inky.vercel.app/api/users/vocabulary-categories");

    var jsonData = json.decode(data.body);

    for (var d in jsonData) {
      VocabularyCategory category =
          VocabularyCategory(d['name'], d['description']);
      vocCategories.add(category);
    }

    return vocCategories;
  }

  Future<List<VocabularyLessonByTitle>> fetchVocabularyLessonsByCategory(category) async{
    List<VocabularyLessonByTitle> vocLessons=[];

    var data = await get("https://nestjs-now-inky.vercel.app/api/users/vocabulary?category=$category");

    var jsonData = json.decode(data.body);

  for(var d in jsonData){
    VocabularyLessonByTitle lesson = VocabularyLessonByTitle(d["title"],d["content"]);
    vocLessons.add(lesson);
  }

  return vocLessons;
  }

  Future<List<Essay>> fetchEssays()async{
    List<Essay> essays = [];

    var data = await get("https://nestjs-now-inky.vercel.app/api/users/essays");
    var jsonData = json.decode(data.body);

  for(var d in jsonData){
    Essay essay = Essay(d["title"],d["content"]);
    essays.add(essay);
  }
  return essays;

  }

  Future<List<PastPaper>> fetchPapers()async{
    List<PastPaper> papers = [];

    var data = await get("https://nestjs-now-inky.vercel.app/api/users/papers");
    var jsonData = json.decode(data.body);

  for(var d in jsonData){
    PastPaper paper = PastPaper(d["name"],d["paper"],d["answers"]);
    papers.add(paper);
  }

  return papers;

  }

  Future<List<GrammerLessonsByTitle>> fetchGrammarLessons() async{
    List<GrammerLessonsByTitle> lessons = [];

    var data = await get("https://nestjs-now-inky.vercel.app/api/users/grammer-lessons");
    var jsonData = json.decode(data.body);

    for(var d in jsonData){
      GrammerLessonsByTitle lesson = GrammerLessonsByTitle(d["title"],d["content"]);
      lessons.add(lesson);
    }

    return List.from(lessons.reversed);
    // return lessons;
  }

  Future<List<VocabularyLessonByTitle>> fetchVocabularyLessons() async{
    List<VocabularyLessonByTitle> vocLessons=[];

    var data = await get("https://nestjs-now-inky.vercel.app/api/users/vocabularies");

    var jsonData = json.decode(data.body);

    for(var d in jsonData){
      VocabularyLessonByTitle lesson = VocabularyLessonByTitle(d["title"],d["content"]);
      vocLessons.add(lesson);
    }

    return List.from(vocLessons.reversed);
  }


}
