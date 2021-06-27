import 'package:flutter/material.dart';
import 'package:sample_project/utiles.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({Key key, this.toprated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: toprated.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            children: [
              SizedBox(
                height: 200,
                width: 150,
                child: ClipRRect(
                  child: Image.network('https://image.tmdb.org/t/p/w500' +
                      toprated[index]['poster_path']),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Modified_text(
                          size: 25,
                          text: toprated[index]['title'] != null
                              ? toprated[index]['title']
                              : 'Loading'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          color: Colors.green[300],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Modified_text(
                                size: 20,
                                text:
                                    toprated[index]['vote_average'].toString() +
                                        " IMDB"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
