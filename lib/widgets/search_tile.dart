import 'package:flutter/material.dart';
import 'package:quadb_task/model/movie_model.dart';
import 'package:quadb_task/screens/detail_screen.dart';

class SearchTile extends StatelessWidget {
  final Movie movie;
  const SearchTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailScreen(movie: movie))),
      child: Container(
        height: 100,
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                movie.show.image != null
                    ? Container(
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(movie.show.image!.medium))),
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/Icons/netflix1.png'),
                                fit: BoxFit.cover)),
                      ),
                Text(
                  movie.show.name,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.play_circle))
          ],
        ),
      ),
    );
  }
}
