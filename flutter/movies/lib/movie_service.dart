import 'dart:convert';
import 'package:http/http.dart' as http;

const apikey = 'b8c79639';
const endpoint = 'http://www.omdbapi.com/';

searchMovies(String text) async {

  if (text == "") {
    return [];
  }

  var response = await http.get(Uri.parse(endpoint + "?apikey=" + apikey + "&s=" + text));
  final responseJson = json.decode(response.body);
  if (responseJson['Search'] != null) {
    return responseJson['Search']
        .where((movie) => movie['Poster'] != "N/A")
        .toList();
  }

  return [];
}

findMovie(String text) async {


  if (text == "") {
    return [];
  }

  var response = await http.get(Uri.parse(endpoint + "?apikey=" + apikey + "&i=" + text));
  return json.decode(response.body);
}
