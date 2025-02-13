import 'package:ott102/data/repositories/movie_repository.dart';

void main() async {
  final repository = MovieRepository();

  final result = await repository.getAllGenres();
  for(var result in result) {
    print(result.name);
  }
}