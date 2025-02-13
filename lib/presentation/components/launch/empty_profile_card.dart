import 'package:flutter/material.dart';
import '../../../common/color.dart';

class EmptyProfileCard extends StatelessWidget {
  const EmptyProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.all(Radius.circular(14))),
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Text(
        '등록된 프로필이 없습니다.\n프로필 추가 후 이용가능 합니다.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
