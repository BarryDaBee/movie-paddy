import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_paddy/app/exports.dart';
import 'package:movie_paddy/presentation/widgets/blurred_container.dart';

class FeaturedMovieCard extends StatelessWidget {
  const FeaturedMovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(36.r),
      child: Stack(
        children: [
          Image.asset('game_movie'.png),
          Positioned(
            left: 15.w,
            bottom: 10.h,
            child: BlurredContainer(
              height: 75.h,
              width: 254.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'play_active'.svg,
                      height: 34.r,
                      width: 34.r,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Continue Watching',
                          style: textTheme.subtitle1,
                        ),
                        Space.y(2.h),
                        Text(
                          'Ready Player one',
                          style: textTheme.bodyText1,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
