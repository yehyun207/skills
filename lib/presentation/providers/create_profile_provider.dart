import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ott102/domain/use_cases/profile_use_case.dart';
import '../../data/models/profile_model.dart';

class CreateProfileProvider extends ChangeNotifier {

  final ProfileUseCase profileUseCase;

  CreateProfileProvider(this.profileUseCase);

  Color profileColor = Color.fromRGBO(
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
    1,
  );

  String profileName = '';

  String get firstCharOfProfileName =>
      profileName.isNotEmpty ? profileName[0] : '';

  void setProfileName(String text) {
    profileName = text;
    notifyListeners();
  }

  Future<void> saveProfile() async {
    final newProfile = ProfileModel.createProfile(profileName, profileColor);
    profileUseCase.saveProfile(newProfile);
  }
}
