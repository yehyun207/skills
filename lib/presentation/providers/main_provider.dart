import 'package:flutter/cupertino.dart';
import 'package:ott102/data/models/genre_model.dart';
import 'package:ott102/data/repositories/movie_repository.dart';
import '../../data/models/movie_model.dart';
import '../../data/models/profile_model.dart';

final MainProvider mainProvider = MainProvider();


class MainProvider extends ChangeNotifier {

  int currentIndex = 0;

  final MovieRepository movieRepository = MovieRepository();

  List<GenreModel> genreList = [];

  List<MovieModel> topRatedMovieList = [];

  List<MovieModel> nowPlayingMovieList = [];

  List<MovieModel> recentOpenMovieList = [];

  List<MovieModel> commingSoonMovieList = [];

  final PageController pageController = PageController();

  late ProfileModel selectedProfile;

  void onTapBottomNavigationItem(int tabIndex) {
    currentIndex = tabIndex;
    pageController.jumpToPage(currentIndex);
    notifyListeners();
  }

  void setSelectedProfile(ProfileModel profile) {
    selectedProfile = profile;
    notifyListeners();
  }

  void loadGenreList() async{
    genreList = await movieRepository.getAllGenres();
    notifyListeners();
  }

  void loadTopRatedMovieList() async {
    topRatedMovieList = await movieRepository.getTopRatedMovies();
    notifyListeners();
  }

  void loadNowPlayingMovieList() async {
    nowPlayingMovieList = await movieRepository.getNowPlayingMovies();
    notifyListeners();
  }

  void loadRecentOpenMovieList() async {
    recentOpenMovieList = await movieRepository.getRecentOpenMovies();
    notifyListeners();
  }

  void loadCommingSoonMovieList() async {
    commingSoonMovieList = await movieRepository.getUpCommingMovies();
    notifyListeners();
  }


}
