import 'package:flutter/material.dart';
import 'movie_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          MovieDetail.routeName: (context) => const MovieDetail(),
        },
        home: Scaffold(
            appBar: AppBar(title: const Text("Movie Search")), body: const Movies()));
  }
}

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  List _movies = [];

  void _updateMovies(String search) {
    searchMovies(search).then((movies) => setState(() {
          _movies = movies;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  color: Colors.black),
              onChanged: _updateMovies),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(10.0),
                      title: Text(_movies[index]['Title'],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      trailing: Image.network(
                        _movies[index]['Poster'],
                        fit: BoxFit.cover,
                        height: 100.0,
                        width: 100.0,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, MovieDetail.routeName,
                            arguments:
                                MovieArguments(_movies[index]['imdbID']));
                      },
                    );
                  }))
        ]);
  }
}

class MovieArguments {
  final String movieId;
  MovieArguments(this.movieId);
}

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();

  static const routeName = '/movies';
}

class _MovieDetailState extends State<MovieDetail> {
  dynamic _movie;
  var _first = true;

  @override
  Widget build(BuildContext context) {
    if (_first) {
      _first = false;
      var args = ModalRoute.of(context)?.settings.arguments as MovieArguments;
      findMovie(args.movieId).then((movie) => setState(() {
            _movie = movie;
          }));
    }
    if (_movie == null) {
      return  MaterialApp(
          home: Scaffold(
              appBar: AppBar(title: const Text("")), body: const Text("")));
    }

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                title: Text(_movie["Title"]),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                )),
            body:  Center(
                child:  Column(children: [
              const SizedBox(height: 10),
               Image.network(
                _movie['Poster'],
                fit: BoxFit.cover,
                height: 400.0,
                width: 400.0,
              ),
              const SizedBox(height: 10),
               const Text("Director",
                  style:  TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black)),
               Text("${_movie['Director']}",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              const SizedBox(height: 10),
              const Text("Year",
                  style:  TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black)),
               Text("${_movie['Year']}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              const SizedBox(height: 10),
              const Text("Actors",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black)),
               Text("${_movie['Actors']}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ]))));
  }
}
