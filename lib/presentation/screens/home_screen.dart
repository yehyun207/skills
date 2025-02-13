import 'package:flutter/material.dart';
import 'package:ott102/presentation/components/widget/star_rated_bar.dart';
import 'package:ott102/presentation/providers/main_provider.dart';
import '../../common/color.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mainProvider.addListener(updateScreen);
      mainProvider.loadGenreList();
      mainProvider.loadTopRatedMovieList();
      mainProvider.loadNowPlayingMovieList();
      mainProvider.loadRecentOpenMovieList();
    });
  }

  @override
  void dispose() {
    mainProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grayColor,
        title: Image.asset(
          'assets/images/showtime_logo.png',
        ),
        actions: [
          SizedBox(
            width: size.width - 60,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: mainProvider.genreList.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    mainProvider.genreList[index].name,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                );
              },
            ),
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: mainProvider.topRatedMovieList.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height - 100,
                    child: Stack(
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/original${mainProvider.topRatedMovieList.first.poster_path}',
                        ),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                backgroundColor,
                                backgroundColor.withOpacity(0),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter,
                                    colors: [
                                      backgroundColor,
                                      backgroundColor.withOpacity(0),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 170,
                                color: backgroundColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                mainProvider
                                    .topRatedMovieList.first.vote_average
                                    .toStringAsFixed(1),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              StarRatedBar(value: 5),
                              SizedBox(height: 12),
                              Text(
                                mainProvider.topRatedMovieList.first.genre_ids
                                    .fold('', (previousValue, id) {
                                  print(id);
                                  final genre = mainProvider.genreList
                                      .firstWhere(
                                          (element) => element.id == id);
                                  return previousValue.isEmpty
                                      ? genre.name
                                      : '$previousValue | ${genre.name}';
                                }),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '방영중인 작품',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.sizeOf(context).width*0.328)*1.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                      mainProvider.nowPlayingMovieList.length,
                      itemBuilder: (context, index) => Image.network(
                        'https://image.tmdb.org/t/p/original/${mainProvider.nowPlayingMovieList[index].poster_path}',
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width * 0.328,
                        height: (MediaQuery.sizeOf(context).width*0.328)*1.2,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '인기 작품',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.sizeOf(context).width*0.328)*1.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                      mainProvider.topRatedMovieList.length,
                      itemBuilder: (context, index) => index == 0 ? SizedBox() : Image.network(
                        'https://image.tmdb.org/t/p/original/${mainProvider.topRatedMovieList[index].poster_path}',
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width * 0.328,
                        height: (MediaQuery.sizeOf(context).width*0.328)*1.2,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '최근 개봉',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.sizeOf(context).width*0.328)*1.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                      mainProvider.recentOpenMovieList.length,
                      itemBuilder: (context, index) => index == 0 ? SizedBox() : Image.network(
                        'https://image.tmdb.org/t/p/original/${mainProvider.recentOpenMovieList[index].poster_path}',
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width * 0.328,
                        height: (MediaQuery.sizeOf(context).width*0.328)*1.2,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
