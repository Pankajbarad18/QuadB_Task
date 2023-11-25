import 'package:flutter/material.dart';
import 'package:quadb_task/model/movie_model.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = '/detailScreen';
  final Movie movie;
  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                movie.show.image != null
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: double.infinity,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                image: NetworkImage(movie.show.image!.original),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: double.infinity,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: const DecorationImage(
                                image: AssetImage('assets/Icons/netflix1.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                Text(
                  movie.show.name,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Year : ${movie.show.premiered.toString().substring(0, 4)}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Text(
                          movie.show.rating.average.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                      Text(
                        'Play',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Type : ${movie.show.type}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Status : ${movie.show.status}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    const Text(
                      'Geners : ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    for (var gen in movie.show.genres)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(gen),
                      )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Summary',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  movie.show.summary
                      .replaceAll('<p>', '')
                      .replaceAll('</p>', ''),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ]),
              Positioned(
                  top: 20,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
