import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/material.dart';

class AppMainWidget extends StatelessWidget {
  final String title;


  const AppMainWidget({
    required this.title,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 54,
          width: 2,
          color: Colors.black,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTextStyle.bold32.value.copyWith(
            color: Colors.white,
            shadows: [
              const Shadow(
                  offset: Offset(0.5, -0.5),
                  color: Colors.black),
              const Shadow(
                  offset: Offset(0.5, -0.5),
                  color: Colors.black),
              const Shadow(
                  offset: Offset(0.5, 0.5),
                  color: Colors.black),
              const Shadow(
                  offset: Offset(-0.5, 0.5),
                  color: Colors.black),
            ],
          ),
        )
      ],
    );
  }
}
