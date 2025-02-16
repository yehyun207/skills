import 'dart:convert';
import 'package:http/http.dart';
import '../models/genre_model.dart';
import '../models/movie_model.dart';

class MovieRepository {
  final Client client = Client();

  static const String base_url = 'https://api.themoviedb.org/3';
  static const String language = 'ko-KR';
  static const String region = 'KR';
  static const String api_key =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTBiMmI1YWExMjZjOTAyM2VhODM0MjNjM2ZlY2M5NCIsIm5iZiI6MTczNjIyNzEwNS44OCwic3ViIjoiNjc3Y2I5MjE3YzllODBiOWU4NzI0MjNkIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.iB3KglOdDW5eXAaTwi5z8M12K15Bwih78EO3fNcreCI';

  Future<Map<String, dynamic>> _fetchData(
    String path, {
    Map<String, String>? queryParameters,
  }) async {
    final uri = Uri.parse('$base_url$path').replace(queryParameters: {
      'language': language,
      'region': region,
      ...?queryParameters,
    });

    final headers = {'Authorization': 'Bearer $api_key'};
    final response = await client.get(uri, headers: headers);

    return jsonDecode(response.body);
  }

  Future<List<GenreModel>> getAllGenres() async {
    final json = await _fetchData('/genre/movie/list');
    return (json['genres'] as List)
        .map((genreJson) => GenreModel.fromJson(genreJson))
        .toList();
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    final json =
        await _fetchData('/movie/top_rated', queryParameters: {'page': '1'});
    return (json['results'] as List)
        .map((movieJson) => MovieModel.fromJson(movieJson))
        .toList();
  }

  Future<List<MovieModel>> getNowPlayingMovies() async {
    final json =
        await _fetchData('/movie/now_playing', queryParameters: {'page': '1'});
    return (json['results'] as List)
        .map((movieJson) => MovieModel.fromJson(movieJson))
        .toList();
  }

  Future<List<MovieModel>> getRecentOpenMovies() async {
    final json =
        await _fetchData('/movie/now_playing', queryParameters: {'page': '1'});
    return (json['results'] as List)
        .map((movieJson) => MovieModel.fromJson(movieJson))
        .toList();
  }

  Future<List<MovieModel>> getUpCommingMovies() async {
    final json =
        await _fetchData('/movie/upcoming', queryParameters: {'page': '1'});
    return (json['results'] as List)
        .map((movieJson) => MovieModel.fromJson(movieJson))
        .toList();
  }
}
