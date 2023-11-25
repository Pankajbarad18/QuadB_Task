import 'package:flutter/material.dart';
import 'package:quadb_task/screens/home_page.dart';
import 'package:quadb_task/screens/search_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _page = 0;

  changePage(int page) {
    setState(() {
      _page = page;
    });
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const Center(child: Text('Downloads')),
    const Center(child: Text('Profile'))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.red,
          currentIndex: _page,
          elevation: 0,
          iconSize: 24,
          onTap: changePage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.download_for_offline), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Home'),
          ]),
    );
  }
}
