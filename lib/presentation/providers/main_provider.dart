import 'package:flutter/cupertino.dart';
import '../../data/models/profile_model.dart';

final MainProvider mainProvider = MainProvider();


class MainProvider extends ChangeNotifier {

  int currentIndex = 0;

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

}