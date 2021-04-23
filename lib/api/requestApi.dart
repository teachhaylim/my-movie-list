import 'package:http/http.dart' as http;
import 'dart:convert' show json;

import 'package:mymovieslist/utils/appConfig.dart';

getData(url) async {
  var response = await http.get(Uri.parse(url));

  return json.decode(response.body)["results"];
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

  return json.decode(res.body);
}

Future getMovieSimilar(movieID) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/tv/$movieID/similar?api_key=$mykey&language=en-US"));

  return json.decode(res.body);
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

  return json.decode(res.body);
}

Future getTVSimilar(tvID) async {
  var res = await http.get(Uri.parse("https://api.themoviedb.org/3/tv/$tvID/similar?api_key=$mykey&language=en-US"));

  return json.decode(res.body);
}

double getRating(double rating) {
  double temp = 10 - rating;

  return 5 - (temp.round() / 2);
}
