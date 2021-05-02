import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final appName = "MyMoviesList";
final mykey = "ef5ba3b7290c00693a61fb4f2d67091d";
final imageUrl = "https://image.tmdb.org/t/p/original";
final accentColor = Colors.purpleAccent;
final primaryLight = Colors.greenAccent;
final primaryDark = Colors.pinkAccent;
final List genres = [
  {"id": 28, "name": "Action", "icon": "assets/genreIcons/action.svg", "color": Colors.red},
  {"id": 12, "name": "Adventure", "icon": "assets/genreIcons/adventure.svg", "color": Colors.purple},
  {"id": 16, "name": "Animation", "icon": "assets/genreIcons/animation.svg", "color": Colors.orange},
  {"id": 35, "name": "Comedy", "icon": "assets/genreIcons/comedy.svg", "color": Colors.blue},
  {"id": 80, "name": "Crime", "icon": "assets/genreIcons/crime.svg", "color": Colors.teal},
  {"id": 878, "name": "Sci-Fi", "icon": "assets/genreIcons/scifi.svg", "color": Colors.pink},
  {"id": 18, "name": "Drama", "icon": "assets/genreIcons/drama.svg", "color": Colors.green},
  {"id": 27, "name": "Horror", "icon": "assets/genreIcons/horror.svg", "color": Colors.cyan},
  {"id": 9648, "name": "Mystery", "icon": "assets/genreIcons/mystery.svg", "color": Colors.cyan},
  {"id": 10749, "name": "Romance", "icon": "assets/genreIcons/romance.svg", "color": Colors.teal},
  {"id": 10402, "name": "Music", "icon": Icon(CupertinoIcons.heart)},
  {"id": 36, "name": "History", "icon": Icon(CupertinoIcons.heart)},
  {"id": 10751, "name": "Family", "icon": Icon(CupertinoIcons.heart)},
  {"id": 14, "name": "Fantasy", "icon": Icon(CupertinoIcons.heart)},
  {"id": 10770, "name": "TV Movie", "icon": Icon(CupertinoIcons.tv)},
  {"id": 99, "name": "Documentary", "icon": Icon(CupertinoIcons.heart)},
  {"id": 53, "name": "Thriller", "icon": Icon(CupertinoIcons.heart)},
  {"id": 10752, "name": "War", "icon": Icon(CupertinoIcons.wand_rays)},
  {"id": 37, "name": "Western", "icon": Icon(CupertinoIcons.square_list_fill)},
];

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
final blankProfile = "https://www.pasrc.org/sites/g/files/toruqf431/files/styles/freeform_750w/public/2021-03/blank-profile-picture-973460_1280.jpg?itok=QzRqRVu8";

//Genre
final movieGenre = "https://api.themoviedb.org/3/genre/movie/list?api_key=$mykey&language=en-US";
