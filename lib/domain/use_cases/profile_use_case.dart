import 'dart:convert';

import 'package:ott102/data/models/profile_model.dart';
import 'package:ott102/data/repositories/shared_pref_repository.dart';

class ProfileUseCase {

  final SharedPrefRepository sharedPrefRepository;

  ProfileUseCase(this.sharedPrefRepository);

  static const profileListKey = "PROFILE_LIST_KEY";

  void saveProfile(ProfileModel newProfile) {
    final profileList = sharedPrefRepository.getStringList(profileListKey);
    profileList.add(jsonEncode(newProfile.toJson()));

    sharedPrefRepository.saveStringList(profileListKey, profileList);
  }

  List<ProfileModel> getProfiles() {
    return sharedPrefRepository.getStringList(profileListKey).map((e) {
      return ProfileModel.fromJson(jsonDecode(e));
    }).toList();
  }
}