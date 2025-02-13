import 'package:flutter/material.dart';
import '../../common/color.dart';
import '../providers/launch_provider.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    launchProvider.addListener(updateScreen);
      launchProvider.startAnimation(context);
    });
  }

  @override
  void dispose() {
    launchProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          AnimatedSlide(
            duration: const Duration(seconds: 1),
            offset: Offset(0, launchProvider.isStartAppBarAnimation ? 0 : -1),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 26),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(18))),
              child: Image.asset(
                'assets/images/worldskills_logo.png',
              ),
            ),
          ),
          Spacer(flex: 1),
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: launchProvider.isStartLogoAnimation ? 1 : 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scaleY: 0.8,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width-40,
                    height: MediaQuery.sizeOf(context).width-40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Color(0xFF4D4D4D),
                        Color(0xFF4D4D4D),
                        Color(0x004D4D4D),
                        Color(0x004D4D4D),
                      ])
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/showtime_logo.png',
                  width: MediaQuery.sizeOf(context).width/2,
                  height: MediaQuery.sizeOf(context).width/2,
                ),
              ],
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
