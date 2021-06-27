import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:sample_project/TopRate.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '6c95656ef44405554443a33b7decad8e';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2Yzk1NjU2ZWY0NDQwNTU1NDQ0M2EzM2I3ZGVjYWQ4ZSIsInN1YiI6IjYwZDZiNDBmOTljOTY0MDA1ZTczMWU3MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cq2NDJYpM-d1BjMVZDBmae3VYcugd4uk9vf0hKaFFEg';
  List topratedmovies = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    print((topratedmovies));
    setState(() {
      topratedmovies = topratedresult['results'];
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Home',
            style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            TopRatedMovies(
              toprated: topratedmovies,
            ),
            SearchBarUI(),
          ],
        ),
      ),
    );
  }
}

Widget SearchBarUI() {
  return FloatingSearchBar(
    hint: 'Search for movies',
    openAxisAlignment: 0.0,
    axisAlignment: 0.0,
    scrollPadding: EdgeInsets.only(top: 16, bottom: 20),
    elevation: 4.0,
    physics: BouncingScrollPhysics(),
    onQueryChanged: (query) {},
    transitionCurve: Curves.easeInOut,
    transitionDuration: Duration(milliseconds: 500),
    transition: CircularFloatingSearchBarTransition(),
    debounceDelay: Duration(milliseconds: 500),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print('Places Pressed');
          },
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
      );
    },
  );
}
