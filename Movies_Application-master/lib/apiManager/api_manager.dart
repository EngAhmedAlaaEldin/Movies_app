import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_application/models/CategoryResponse.dart';
import 'package:movie_application/models/LikeMoviesResponse.dart';
import 'package:movie_application/models/PopularResponse.dart';
import 'package:movie_application/models/SearchRespnse.dart';
import 'package:movie_application/models/TopRatedResponse.dart';
import '../models/CategoryListResponse.dart';

class ApiManager {
  static const String baseUrl = 'api.themoviedb.org';
  static const String apiKey = 'a6c404179ede61ad21d79677a7366c47';

  static Future<TopRatedResponse> topRated() async {
    var uri = Uri.https(baseUrl, '/3/movie/top_rated', {'api_key': apiKey});
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return TopRatedResponse.fromJson(json);
    }
    throw Exception('error');
  }

  static Future<PopularResponse> popularMovieData() async {
    var uri = Uri.https(baseUrl, '/3/movie/popular', {'api_key': apiKey});
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return PopularResponse.fromJson(json);
    }
    throw Exception('error');
  }

  static Future<LikeMoviesResponse> likeMovies(int movieId) async {
    var uri = Uri.https(baseUrl, '/3/movie/$movieId/similar',
        {'api_key': apiKey, 'movie_id': ''});
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return LikeMoviesResponse.fromJson(json);
    }
    throw Exception('error');
  }

  static Future<SearchResponse> searchMovie(String query) async {
    var uri = Uri.https(
        baseUrl, '/3/search/movie', {'api_key': apiKey, 'query': query});
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SearchResponse.fromJson(json);
    }
    throw Exception('error');
  }

  static Future<CategoryResponse> movieCategory() async {
    var uri = Uri.https(baseUrl, '/3/genre/movie/list', {
      'api_key': apiKey,
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return CategoryResponse.fromJson(json);
    }
    throw Exception('error');
  }

  static Future<CategoryListResponse> categoryList(num catId) async {
    var uri = Uri.https(baseUrl, '/3/discover/movie', {
      'api_key': apiKey,
      'with_genres': catId.toString(),
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return CategoryListResponse.fromJson(json);
    }
    throw Exception('error');
  }
}
