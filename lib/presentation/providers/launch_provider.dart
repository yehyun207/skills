import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/select_profile_screen.dart';

final launchProvider = LaunchProvider();

class LaunchProvider extends ChangeNotifier {

  bool isStartAppBarAnimation = false;
  bool isStartLogoAnimation = false;

  void startAnimation(BuildContext context) async{
    isStartAppBarAnimation = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1, milliseconds: 500));

    isStartLogoAnimation = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectProfileScreen()));

  }
}