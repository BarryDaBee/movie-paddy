import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_paddy/app/exports.dart';
import 'package:movie_paddy/presentation/widgets/blurred_container.dart';
import 'package:movie_paddy/presentation/widgets/featured_movie_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 26.w,
        vertical: 48.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFFF8F71),
                      Color(0xFFEF2D1A),
                    ],
                  ).createShader(bounds);
                },
                child: Text(
                  'Stream',
                  style: textTheme.headline2,
                ),
              ),
              Space.x(10.sp),
              Text(
                'Everywhere',
                style: textTheme.headline2,
              ),
            ],
          ),
          Space.y(30.sp),
          const FeaturedMovieCard(),
          Space.y(43.h),
          Text(
            "Trending",
            style: textTheme.headline2,
          ),
          Space.y(28.h),
          CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, pageViewIndex) {
              return const TrendingMovieCard();
            },
            options: CarouselOptions(
              height: 340.h,
              enableInfiniteScroll: true,
              viewportFraction: 0.75,
              autoPlay: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}

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
