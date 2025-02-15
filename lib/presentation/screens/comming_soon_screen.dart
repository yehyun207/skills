import 'package:flutter/material.dart';
import 'package:ott102/common/color.dart';
import '../../common/tab_type.dart';
import '../providers/main_provider.dart';

class CommingSoonScreen extends StatefulWidget {
  const CommingSoonScreen({super.key});

  @override
  State<CommingSoonScreen> createState() => _CommingSoonScreenState();
}

class _CommingSoonScreenState extends State<CommingSoonScreen> {
  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mainProvider.addListener(updateScreen);
      mainProvider.loadCommingSoonMovieList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text(
            TabType.commingSoon.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: backgroundColor,
        body: GridView.builder(
          itemCount: mainProvider.topRatedMovieList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (MediaQuery.sizeOf(context).width * 0.28) /
                (((MediaQuery.sizeOf(context).width * 0.28) * 1.2) + 100),
          ),
          itemBuilder: (context, index) {
            return Column(children: [
              Image.network(
                'https://image.tmdb.org/t/p/original/${mainProvider.topRatedMovieList[index].poster_path}',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${mainProvider.topRatedMovieList[index].release_date.replaceAll('-', '.')}',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              )
            ]);
          },
        ));
  }
}
