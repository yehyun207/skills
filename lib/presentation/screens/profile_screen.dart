import 'package:flutter/material.dart';
import 'package:ott102/presentation/providers/main_provider.dart';
import 'package:ott102/presentation/providers/select_profile_provider.dart';
import '../../common/color.dart';
import '../../common/tab_type.dart';
import '../../data/models/profile_model.dart';
import '../providers/create_profile_provider.dart';
import 'create_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      selectProfileProvider.addListener(updateScreen);
      selectProfileProvider.loadProfiles();
    });
  }

  @override
  void dispose() {
    selectProfileProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          TabType.profile.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: selectProfileProvider.profiles.map((profile) {
                    return GestureDetector(
                      onTap: () {
                        mainProvider.setSelectedProfile(profile);
                        mainProvider.onTapBottomNavigationItem(TabType.home.index);
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          border: profile.id == mainProvider.selectedProfile.id ? Border.all(width: 1.5, color: Colors.white) : null,
                          color: profile.backgroundColor,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          profile.profileName[0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: () async{
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => CreateProfileScreen()),
                    );
                    selectProfileProvider.loadProfiles();
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 60,
                      ),
                      SizedBox(height: 6),
                      Text(
                        '프로필 추가',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                '일반 설정',
                style: TextStyle(
                  color: Color(0xffF76E02),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _profileList('프로필'),
              _profileList('언어 변경'),
              _profileList('새 기기 연결하기'),
              _profileList('앱 권한 설정'),
              _profileList('로그아웃'),
              _profileList('이용약관 동의'),
              _profileList('개인정보처리방침'),
              _profileList('오픈소스 활용 안내'),
              _profileList('기타 문의'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileList(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
