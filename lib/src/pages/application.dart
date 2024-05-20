import 'package:flexnews/src/pages/news_details.dart';
import 'package:flexnews/src/pages/news_page.dart';
import 'package:flexnews/src/pages/profile_page.dart';
import 'package:flexnews/src/pages/sports_news.dart';
import 'package:flexnews/src/pages/top_headlines.dart';
import 'package:flutter/material.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _selectedIndex = 0;
  

  static final List<Widget> _pages = <Widget>[
    const TopHeadlines(),
    const NewsPage(),
    const SportsPage(),
    const ProfileScreen()
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Currency',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Sports',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 18,
        unselectedFontSize: 16,
      ),
    );
  }
}
