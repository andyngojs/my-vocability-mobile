import 'package:flutter/material.dart';
import 'package:my_vocability/features/flashcard/presentation/pages/flashcard_page.dart';
import 'package:my_vocability/features/more/presentation/more_page.dart';
import 'package:my_vocability/features/vocab/presentation/pages/vocab_page.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    FlashcardPage(),
    VocabPage(),
    MorePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Flashcard'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books_rounded), label: 'Vocabulary'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}