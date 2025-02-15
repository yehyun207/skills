import 'dart:ui';

class ProfileModel {

  final int id;

  final String profileName;

  final Color backgroundColor;

  ProfileModel({
    required this.id,
    required this.profileName,
    required this.backgroundColor,
  });

  factory ProfileModel.createProfile(String profileName,
      Color backgroundColor) {
    return ProfileModel(
      id: DateTime
          .now()
          .millisecondsSinceEpoch,
      profileName: profileName,
      backgroundColor: backgroundColor,);
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      profileName: json['profileName'],
      backgroundColor: Color.fromRGBO(json['r'], json['g'], json['b'], 1),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profileName': profileName,
      'r': backgroundColor,
      'g': backgroundColor,
      'b': backgroundColor,
    };
  }

}