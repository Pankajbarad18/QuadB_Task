import 'package:flutter/material.dart';
import 'package:quadb_task/screens/bottom_navi.dart';
import 'package:quadb_task/screens/home_page.dart';
import 'package:quadb_task/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuadB Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black38,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black38),
        canvasColor: Colors.black,
        useMaterial3: true,
      ),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
      },
      home: const BottomNavigation(),
    );
  }
}
