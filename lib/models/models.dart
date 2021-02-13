class GrammerLessonCategory{
  String name;
  String description;

  GrammerLessonCategory(this.name ,this.description);

  GrammerLessonCategory.fromJson(Map<String, dynamic> parsedJson) {
     name= parsedJson["name"];
     description = parsedJson["description"];
    
  }
}

class GrammerLessonsByTitle{
  String title;
  String content;

  GrammerLessonsByTitle(this.title,this.content);

  GrammerLessonsByTitle.fromJson(Map<String , dynamic> parsedJson){
    title = parsedJson["title"];
    content = parsedJson["content"];
  }
}

class VocabularyCategory{
  String name;
  String description;

  VocabularyCategory(this.name , this.description);

  VocabularyCategory.fromJson(Map<String , dynamic>parsedJson){
    name = parsedJson["name"];
    description = parsedJson["description"];
  }
}

class VocabularyLessonByTitle{
  String title;
  String content;

  VocabularyLessonByTitle(this.title,this.content);

  VocabularyLessonByTitle.fromJson(Map<String , dynamic>parsedJson){
    title = parsedJson["title"];
    content = parsedJson["content"];
  }
}

class Essay{
  String title;
  String content;

  Essay(this.title,this.content);

  Essay.fromJson(Map<String , dynamic>parsedJson){
    title = parsedJson["title"];
    content = parsedJson["content"];
  }
}

class PastPaper{
  String name;
  String paper;
  String answers;

  PastPaper(this.name , this.paper,this.answers);

  PastPaper.fromJson(Map<String , dynamic>parsedJson){
    name = parsedJson["name"];
    paper=  parsedJson["paper"];
    answers = parsedJson["answers"];
  }
}