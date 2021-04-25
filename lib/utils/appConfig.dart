import 'package:flutter/material.dart';

final appName = "MyMoviesList";
final mykey = "ef5ba3b7290c00693a61fb4f2d67091d";
final imageUrl = "https://image.tmdb.org/t/p/original";
final accentColor = Colors.purpleAccent;
final primaryLight = Colors.greenAccent;
final primaryDark = Colors.pinkAccent;

//Movie
final popularUrl = "https://api.themoviedb.org/3/movie/popular?api_key=$mykey&language=en-US&page=1";

final upcomingUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=$mykey&language=en-US&page=1";

final showingUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=$mykey&language=en-US&page=1";

final topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=$mykey&language=en-US&page=1";

//TV
final tvPopularUrl = "https://api.themoviedb.org/3/tv/popular?api_key=$mykey&language=en-US&page=1";

final tvAirTodayUrl = "https://api.themoviedb.org/3/tv/airing_today?api_key=$mykey&language=en-US&page=1";

final tvOnAirUrl = "https://api.themoviedb.org/3/tv/on_the_air?api_key=$mykey&language=en-US&page=1";

final tvTopRatedUrl = "https://api.themoviedb.org/3/tv/top_rated?api_key=$mykey&language=en-US&page=1";

//Trending
final tvTrendingUrl = "https://api.themoviedb.org/3/trending/tv/week?api_key=$mykey";

final movieTrendingUrl = "https://api.themoviedb.org/3/trending/movie/week?api_key=$mykey";

//Other
final blankProfile = "https://lifelinemedicalservices.co.uk/wp-content/uploads/2020/06/blank-profile-picture-973460_1280.jpg";
