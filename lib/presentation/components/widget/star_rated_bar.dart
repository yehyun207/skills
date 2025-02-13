import 'package:flutter/material.dart';

class StarRatedBar extends StatelessWidget {
  const StarRatedBar({super.key, required double value}) : value = value / 2;

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final movieAvg = value - index;
          return Icon(
            movieAvg >= 1
                ? Icons.star_rounded
                : movieAvg >= 0.5
                    ? Icons.star_half_rounded
                    : Icons.star_border_rounded,
            color: Color(0xFFFFB221),
            size: 28,
          );
        },
      ),
    );
  }
}
