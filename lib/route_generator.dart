import 'package:client_update/screens/essays/essay_home_page.dart';
import 'package:client_update/screens/grammer_lessons/grammer_lessons_by_category.dart';
import 'package:client_update/screens/grammer_lessons/home_page.dart';
import 'package:client_update/screens/loading_screen.dart';
import 'package:client_update/screens/past-papers/pastpaper_home_page.dart';
import 'package:client_update/screens/vocabulary_lessons/Home_page.dart';
import 'package:client_update/screens/vocabulary_lessons/vocabulary_lesson_categories.dart';
import 'package:client_update/screens/vocabulary_lessons/vocabulary_lessons_by_category.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/loading':
        return PageTransition(child: LoadingPage(), type: PageTransitionType.rightToLeft);
      case '/lessonsByCategory':
        return PageTransition(child: GrammerLessonsByCategory(name:args), type:PageTransitionType.rightToLeft );
      case '/grammarHomePage':
        return PageTransition(child: HomePage(), type:PageTransitionType.rightToLeft );
      case '/vocabularyHomePage':
        return PageTransition(child: VocabularyHomePage(), type: PageTransitionType.rightToLeft);
      case '/vocabularyByCategory':
        return PageTransition(child: VocbularyLessonsByCategory(name:args), type: PageTransitionType.rightToLeft);
      case '/essayHomePage':
        return PageTransition(child: EssayHomePage(), type: PageTransitionType.rightToLeft);
      case '/pastPaperHome':
        return PageTransition(child: PastPaperHomePage(), type: PageTransitionType.rightToLeft);
    }

  }
}