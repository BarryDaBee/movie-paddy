import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_paddy/app/exports.dart';
import 'package:movie_paddy/presentation/widgets/blurred_container.dart';

class TrendingMovieCard extends StatelessWidget {
  const TrendingMovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(32.r),
      child: Stack(
        children: [
          Image.asset(
            'star_wars'.png,
          ),
          Positioned(
            right: 20.r,
            top: 20.r,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                ),
                child: BlurredContainer(
                  height: 55.4.h,
                  width: 92.74.w,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IMDb',
                          style: textTheme.subtitle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Color(0xFFF3BE00),
                            ),
                            Text(
                              '7.0',
                              style: textTheme.bodyText1,
                            )
                          ],
                        )
                        // #
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BlurredContainer(
                width: 230.w,
                height: 85.h,
                child: Center(
                  child: Text(
                    'Star Wars: The Last Jedi',
                    style: textTheme.bodyText1!.copyWith(fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
