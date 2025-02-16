import 'package:flutter/material.dart';
import 'package:ott102/presentation/providers/main_provider.dart';
import 'package:ott102/presentation/screens/up_comming_screen.dart';
import 'package:ott102/presentation/screens/download_screen.dart';
import 'package:ott102/presentation/screens/home_screen.dart';
import 'package:ott102/presentation/screens/profile_screen.dart';
import 'package:ott102/presentation/screens/search_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mainProvider.addListener(updateScreen);
    });
  }

  @override
  void dispose() {
    mainProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: mainProvider.pageController,
        children: [
          HomeScreen(),
          CommingSoonScreen(),
          DownloadScreen(),
          SearchScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainProvider.currentIndex,
        onTap: (index) {
          mainProvider.onTapBottomNavigationItem(index);
        },
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'HOME'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow), label: '공개예정'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.download_outlined), label: '다운로드'),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: mainProvider.selectedProfile.backgroundColor,
              child: Text(
                mainProvider.selectedProfile.profileName[0] ?? '?',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            label: '프로필',
          ),
        ],
      ),
    );
  }
}
