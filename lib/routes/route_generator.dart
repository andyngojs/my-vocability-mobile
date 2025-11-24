import 'package:flutter/material.dart';

import 'package:my_vocability/routes/routes.dart';

import 'package:my_vocability/app/main_tab.dart';
import 'package:my_vocability/features/flashcard/presentation/pages/flashcard_page.dart';
import 'package:my_vocability/features/vocab/presentation/pages/vocab_page.dart';
import 'package:my_vocability/features/more/presentation/pages/more_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case AppRoute.home:
        return MaterialPageRoute(builder: (_) => MainTabPage());

      case AppRoute.flashcard:
        return MaterialPageRoute(builder: (_) => FlashcardPage());

      case AppRoute.vocabulary:
        return MaterialPageRoute(builder: (_) => VocabPage());

      case AppRoute.more:
        return MaterialPageRoute(builder: (_) => MorePage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSetting.name}'),
            ),
          ),
        );
    }
  }
}
