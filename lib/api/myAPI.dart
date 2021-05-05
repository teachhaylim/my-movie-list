import 'package:http/http.dart' as http;
import 'dart:convert' show json;

import 'package:mymovieslist/utils/appConfig.dart';

getData(url) async {
  var response = await http.get(Uri.parse(url));

  return json.decode(response.body)["results"];
}

getGenre(url) async {
  var response = await http.get(Uri.parse(url));

  return json.decode(response.body)["genres"];
}

searchMovie(query) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=$mykey&language=en-US&query=$query&page=1&include_adult=false"));

  return json.decode(res.body)["results"];
}

getMovieByGenre(genreID) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/discover/movie?api_key=$mykey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=$genreID&with_watch_monetization_types=flatrate"));

  return json.decode(res.body)["results"];
}

Future getMovieDetail(movieID) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$movieID?api_key=$mykey&language=en-US"));

  return json.decode(res.body);
}

Future getMovieCredit(movieID) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$mykey&language=en-US"));

  return json.decode(res.body);
}

Future getMovieReview(movieID) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$movieID/reviews?api_key=$mykey&language=en-US"));

  return json.decode(res.body)["results"];
}

Future getMovieSimilar(movieID) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$movieID/similar?api_key=$mykey&language=en-US"));

  return json.decode(res.body)["results"];
}

Future getTVDetail(tvID) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/tv/$tvID?api_key=$mykey&language=en-US"));

  return json.decode(res.body);
}

Future getTVCredit(tvID) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/tv/$tvID/credits?api_key=$mykey&language=en-US"));

  return json.decode(res.body);
}

Future getTVReview(tvID) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/tv/$tvID/reviews?api_key=$mykey&language=en-US"));

  return json.decode(res.body)["results"];
}

Future getTVSimilar(tvID) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/tv/$tvID/similar?api_key=$mykey&language=en-US"));

  return json.decode(res.body)["results"];
}

double getRating(double rating) {
  double temp = 10 - rating;

  return 5 - (temp.round() / 2);
}

String getArr(arr, key, option, resultKey) {
  String result = "";

  arr.forEach((p) => {
        if (p[key].toString().toLowerCase() == option.toString().toLowerCase()) {result = p[resultKey]}
      });

  return result.toString();
}

String getTVArr(arr, key, option, position, resultKey) {
  String result = "";

  arr.forEach((p) => {
        if (p[key].toString().toLowerCase() == option.toString().toLowerCase())
          {
            result = p[resultKey],
          }
      });

  return result.toString();
}

String getValue(arr, key) {
  String result = "";

  for (var i = 0; i < arr.length; i++) {
    if (arr.length - 1 == i) {
      result += arr[i][key];
    } else {
      result += arr[i][key] + ",\n";
    }
  }

  return result;
}
