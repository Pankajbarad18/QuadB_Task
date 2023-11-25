import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quadb_task/model/movie_model.dart' as model;
import 'package:quadb_task/screens/detail_screen.dart';
import 'package:quadb_task/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<model.Movie> _movieList = [];

class _HomeScreenState extends State<HomeScreen> {
  Future<List<model.Movie>> fetchData() async {
    final res =
        await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
    var data = jsonDecode(res.body.toString());
    if (res.statusCode == 200) {
      _movieList = [];
      for (Map<String, dynamic> i in data) {
        _movieList.add(model.Movie.fromMap(i));
      }
      return _movieList;
    } else {
      throw Exception('Error in Getting Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        leading: Image.asset('assets/Icons/netflix.png'),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, SearchScreen.routeName),
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 300,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.5,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: _movieList.sublist(1, 6).map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailScreen(movie: i))),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                i.show.image!.original))),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                            child: Text(
                          'Charming Feel-Good Dramedy Movie',
                          style: TextStyle(fontSize: 22),
                        )),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Column(
                              children: [
                                Icon(Icons.add),
                                Text(
                                  'My List',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 80,
                              height: 30,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              color: Colors.white,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'Play',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Column(
                              children: [
                                Icon(Icons.info_outline),
                                Text(
                                  'info',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Popular Show',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _movieList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              movie: _movieList[index]))),
                                  child: Column(
                                    children: [
                                      _movieList[index].show.image != null
                                          ? Container(
                                              height: 250,
                                              width: 150,
                                              margin: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          _movieList[index]
                                                              .show
                                                              .image!
                                                              .original),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            )
                                          : Container(
                                              height: 250,
                                              width: 150,
                                              margin: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Icons/netflix1.png'),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
            }),
      ),
    );
  }
}
