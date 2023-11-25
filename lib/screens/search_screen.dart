import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quadb_task/model/movie_model.dart' as model;
import 'package:quadb_task/widgets/search_tile.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = '/searchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

List<model.Movie> _movieList = [];

class _SearchScreenState extends State<SearchScreen> {
  Future<List<model.Movie>> searchedData(String query) async {
    final res = await http
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=${query}'));
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
        body: Column(
      children: [
        Container(
          height: 70,
          margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
          padding: const EdgeInsets.all(10),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                labelText: 'Search Here',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.white))),
            onChanged: (String val) async {
              await searchedData(val);
              setState(() {});
            },
          ),
        ),
        if (_movieList.isNotEmpty)
          Expanded(
            child: ListView.builder(
                itemCount: _movieList.length,
                itemBuilder: (context, index) {
                  return SearchTile(movie: _movieList[index]);
                }),
          )
      ],
    ));
  }
}
